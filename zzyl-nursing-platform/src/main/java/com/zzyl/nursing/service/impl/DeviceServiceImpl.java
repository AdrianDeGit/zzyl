package com.zzyl.nursing.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.date.DatePattern;
import cn.hutool.core.date.LocalDateTimeUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.huaweicloud.sdk.iotda.v5.IoTDAClient;
import com.huaweicloud.sdk.iotda.v5.model.*;
import com.zzyl.common.core.domain.AjaxResult;
import com.zzyl.common.exception.base.BaseException;
import com.zzyl.common.utils.StringUtils;
import com.zzyl.nursing.domain.Device;
import com.zzyl.nursing.domain.dto.DeviceDTO;
import com.zzyl.nursing.domain.vo.DeviceDetailVO;
import com.zzyl.nursing.domain.vo.ProductVO;
import com.zzyl.nursing.mapper.DeviceMapper;
import com.zzyl.nursing.service.IDeviceService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZoneOffset;
import java.util.*;
import java.util.concurrent.TimeUnit;


/**
 * 设备Service业务层处理
 *
 * @author Adrian
 * @date 2025-07-23
 */
@Service
@Slf4j
public class DeviceServiceImpl extends ServiceImpl<DeviceMapper, Device> implements IDeviceService {
    @Resource
    private DeviceMapper deviceMapper;

    @Resource
    private RedisTemplate<String, String> redisTemplate;

    @Resource
    private IoTDAClient ioTDAClient;

    public static final String ALL_PRODUCT_KEY = "iot:all_product";

    /**
     * 查询设备
     *
     * @param id 设备主键
     * @return 设备
     */
    @Override
    public Device selectDeviceById(Long id) {
        return getById(id);
    }

    /**
     * 查询设备列表
     *
     * @param device 设备
     * @return 设备
     */
    @Override
    public List<Device> selectDeviceList(Device device) {
        return deviceMapper.selectDeviceList(device);
    }

    /**
     * 新增设备
     *
     * @param device 设备
     * @return 结果
     */
    @Override
    public int insertDevice(Device device) {
        return save(device) ? 1 : 0;
    }

    /**
     * 修改设备
     *
     * @param device 设备
     * @return 结果
     */
    @Override
    public int updateDevice(Device device) {
        return updateById(device) ? 1 : 0;
    }

    /**
     * 批量删除设备
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    @Override
    public int deleteDeviceByIds(Long[] ids) {
        return deviceMapper.deleteDeviceByIds(ids);
    }

    /**
     * 删除设备信息
     *
     * @param id 设备主键
     * @return 结果
     */
    @Override
    public int deleteDeviceById(Long id) {
        return removeById(id) ? 1 : 0;
    }

    /**
     * 从物联网平台同步产品列表
     */
    @Override
    public void syncProductList() {
        // 请求参数
        ListProductsRequest listProductsRequest = new ListProductsRequest();
        // 设置条数
        listProductsRequest.setLimit(50);
        log.info("物联网接口 - 查询产品，入参为: {}", listProductsRequest);
        ListProductsResponse listProductsResponse = ioTDAClient.listProducts(listProductsRequest);
        log.info("物联网接口 - 查询产品，出参为: {}", listProductsResponse);
        if (listProductsResponse.getHttpStatusCode() != 200) {
            throw new BaseException("物联网接口 - 查询产品，同步失败");
        }
        // 存储到redis：增加过期时间随机值避免【缓存雪崩】
        redisTemplate.opsForValue().set(ALL_PRODUCT_KEY,
                JSONUtil.toJsonStr(listProductsResponse.getProducts()),
                60 * 60 * 24 + (int) (Math.random() * 100), TimeUnit.SECONDS);
    }

    /**
     * 查询所有产品列表
     *
     * @return 产品列表
     */
    @Override
    public List<ProductVO> allProduct() {
        // 从redis中查询数据
        String jsonStr = redisTemplate.opsForValue().get(ALL_PRODUCT_KEY);
        // 如果数据为空，则返回一个空集合
        if (StringUtils.isEmpty(jsonStr)) {
            return Collections.emptyList();
        }
        // 解析数据，并返回
        return JSONUtil.toList(jsonStr, ProductVO.class);
    }

    /**
     * 注册设备
     *
     * @param deviceDTO
     */
    @Override
    public void registerDevice(DeviceDTO deviceDTO) {
        // 1.检查设备名称是否重复
        // 1.1 构建LambdaQueryWrapper对象
        LambdaQueryWrapper<Device> lambdaQueryWrapper = new LambdaQueryWrapper<>();

        // 1.2 设置设备名字筛选条件
        lambdaQueryWrapper
                .eq(ObjectUtil.isNotEmpty(deviceDTO.getDeviceName()), Device::getDeviceName, deviceDTO.getDeviceName());

        // 1.3 执行查询，获取查询匹配的个数，个数大于0，说明已存在，抛出异常，提示设备名称重复
        if (count(lambdaQueryWrapper) > 0) {
            log.error("注册设备失败：设备名称 【{}】 重复", deviceDTO.getDeviceName());
            throw new BaseException("注册设备失败：设备名称 【" + deviceDTO.getDeviceName() + "】 重复");
        }

        // 2.检查设备标识码是否重复
        // 2.1 LambdaQueryWrapper对象清除上面的筛选条件（clear方法）
        lambdaQueryWrapper.clear();

        // 2.2 设置设备设备标识码筛选条件
        lambdaQueryWrapper.eq(ObjectUtil.isNotEmpty(deviceDTO.getNodeId()), Device::getNodeId, deviceDTO.getNodeId());

        // 2.3 执行查询，获取查询匹配的个数，个数大于0，说明已存在，抛出异常，提示设备标识码重复
        if (count(lambdaQueryWrapper) > 0) {
            log.error("注册设备失败：设备标识码 【{}】 重复", deviceDTO.getNodeId());
            throw new BaseException("注册设备失败：设备标识码 【" + deviceDTO.getNodeId() + "】 重复");
        }

        // 3.检查同一位置是否绑定了相同的产品
        // 1.1 LambdaQueryWrapper对象清除上面的筛选条件（clear方法）
        lambdaQueryWrapper.clear();

        // 1.2 设置筛选条件：binding_location，location_type,physical_location_type,product_key查询有数据代表同一位置绑定了相同产品的设备
        lambdaQueryWrapper
                .eq(ObjectUtil.isNotEmpty(deviceDTO.getBindingLocation()), Device::getBindingLocation, deviceDTO.getBindingLocation())
                .eq(ObjectUtil.isNotEmpty(deviceDTO.getLocationType()), Device::getLocationType, deviceDTO.getLocationType())
                .eq(ObjectUtil.isNotEmpty(deviceDTO.getPhysicalLocationType()), Device::getPhysicalLocationType, deviceDTO.getPhysicalLocationType())
                .eq(ObjectUtil.isNotEmpty(deviceDTO.getProductKey()), Device::getProductKey, deviceDTO.getProductKey());

        // 1.3 执行查询，获取查询匹配的个数，个数大于0，说明已存在，抛出异常，提示设同一位置绑定了相同产品的设备
        if (count(lambdaQueryWrapper) > 0) {
            log.error("注册设备失败：同一位置绑定了相同产品的设备");
            throw new RuntimeException("注册设备失败：同一位置绑定了相同产品的设备");
        }

        // 4.项目华为IOT平台注册设备
        // 4.1 请求参数对象AddDeviceRequest对象
        AddDeviceRequest addDeviceRequest = new AddDeviceRequest();

        // 4.2 请求体参数对象AddDevice对象
        AddDevice addDevice = new AddDevice();
        // 设备标识码 node_id
        addDevice.setNodeId(deviceDTO.getNodeId());
        // 设备名称 device_name
        addDevice.setDeviceName(deviceDTO.getDeviceName());
        // 产品id product_id
        addDevice.setProductId(deviceDTO.getProductKey());
        // 实例AuthInfo对象，封装secret（自己生成唯一值）
        AuthInfo authInfo = new AuthInfo();
        String secret = UUID.randomUUID().toString().replaceAll("-", "");
        authInfo.setSecret(secret);
        // AddDevice对象封装AuthInfo对象(withAuthInfo)
        addDevice.withAuthInfo(authInfo);
        // AddDeviceRequest对象封装AddDevice对象（withBody）
        addDeviceRequest.setBody(addDevice);
        // 4.3 执行请求，获取响应结果AddDeviceResponse对象
        AddDeviceResponse addDeviceResponse = ioTDAClient.addDevice(addDeviceRequest);
        // 4.4 判断响应状态为是否为201,如果不是抛出异常，提示“物联网平台-注册设备失败”
        if (addDeviceResponse.getHttpStatusCode() != 201) {
            log.error("物联网平台-注册设备失败");
            throw new BaseException("注册设备失败：物联网平台-注册设备失败");
        }
        // 4.5 提示设备注册成功
        log.info("物联网平台-注册设备【{}】成功", deviceDTO.getDeviceName());

        // 5.本地保存设备数据到数据库中
        // 5.1 将前端传递过来的deviceDTO对象数据封装赋值给Device对象
        Device device = new Device();
        BeanUtil.copyProperties(deviceDTO, device);
        // 5.2 补全数据
        // iot_id 从AddDeviceResponse对象中获取
        device.setIotId(addDeviceResponse.getDeviceId());
        // secret
        device.setSecret(secret);
        // 判断是否是随身设备，如果是，物理位置类型为-1
        if (device.getLocationType() == 0) {
            device.setPhysicalLocationType(-1);
        }
        // 5.3 插入数据库
        try {
            save(device);
        } catch (Exception e) {
            log.error("注册设备失败：{}", e.getMessage());
            throw new BaseException("注册设备失败，原因：" + e.getMessage());
        }
    }

    /**
     * 获取设备详细信息
     *
     * @param iotId
     * @return
     */
    @Override
    public DeviceDetailVO queryDeviceDetail(String iotId) {
        // 查询数据库
        Device device = getOne(Wrappers.<Device>lambdaQuery().eq(Device::getIotId, iotId));
        if (ObjectUtil.isEmpty(device)) {
            return null;
        }

        // 调用华为云物联网接口
        ShowDeviceRequest request = new ShowDeviceRequest();
        request.setDeviceId(iotId);
        ShowDeviceResponse response;
        try {
            response = ioTDAClient.showDevice(request);
        } catch (Exception e) {
            log.info("物联网接口 - 查询设备详情，调用失败:{}", e.getMessage());
            throw new BaseException("物联网接口 - 查询设备详情，调用失败");
        }

        // 属性拷贝
        DeviceDetailVO deviceDetailVO = BeanUtil.toBean(device, DeviceDetailVO.class);

        deviceDetailVO.setDeviceStatus(response.getStatus());
        String activeTimeStr = response.getActiveTime();
        if (StringUtils.isNotEmpty(activeTimeStr)) {
            LocalDateTime activeTime = LocalDateTimeUtil.parse(activeTimeStr, DatePattern.UTC_MS_PATTERN);
            // 日期时区转换
            activeTime = activeTime.atZone(ZoneId.from(ZoneOffset.UTC))
                    .withZoneSameInstant(ZoneId.of("Asia/Shanghai"))
                    .toLocalDateTime();
            deviceDetailVO.setActiveTime(activeTime);
        }

        return deviceDetailVO;
    }

    /**
     * 查询设备上报数据
     *
     * @param iotId
     */
    @Override
    public AjaxResult queryServiceProperties(String iotId) {
        // 创建查询设备影子数据的请求
        ShowDeviceShadowRequest request = new ShowDeviceShadowRequest();
        // 设置设备ID
        request.setDeviceId(iotId);
        // 调用物联网接口查询设备影子数据
        ShowDeviceShadowResponse response = ioTDAClient.showDeviceShadow(request);
        // 判断接口调用是否成功
        if (response.getHttpStatusCode() != 200) {
            // 抛出异常
            throw new BaseException("物联网接口 - 查询设备上报数据，调用失败");
        }
        // 获取设备影子数据
        List<DeviceShadowData> shadow = response.getShadow();
        // 判断设备影子数据是否为空
        if (CollectionUtil.isEmpty(shadow)) {
            // 返回空列表
            List<Object> emptyList = Collections.emptyList();
            return AjaxResult.success(emptyList);
        }
        // 返回数据
        // 将设备影子数据中的reported属性转换为JSON对象
        JSONObject jsonObject = JSONUtil.parseObj(shadow.get(0).getReported().getProperties());

        List<Map<String, Object>> list = new ArrayList<>();

        // 处理上报时间日期
        // 将设备影子数据中的eventTime属性转换为LocalDateTime对象
        LocalDateTime activeTime = LocalDateTimeUtil.parse(shadow.get(0).getReported().getEventTime(), "yyyyMMdd'T'HHmmss'Z'");
        // 日期时区转换
        // 将UTC时区转换为上海时区
        LocalDateTime eventTime = activeTime.atZone(ZoneId.from(ZoneOffset.UTC))
                .withZoneSameInstant(ZoneId.of("Asia/Shanghai"))
                .toLocalDateTime();

        // 遍历JSON对象中的属性
        jsonObject.forEach((propertiesKey, propertiesValue) -> {
            Map<String, Object> map = new HashMap<>();
            // 将属性名作为functionId
            map.put("functionId", propertiesKey);
            // 将属性值作为value
            map.put("value", propertiesValue);
            // 将转换后的日期作为eventTime
            map.put("eventTime", eventTime);
            // 将map添加到list中
            list.add(map);
        });

        // 返回list
        return AjaxResult.success(list);
    }
}