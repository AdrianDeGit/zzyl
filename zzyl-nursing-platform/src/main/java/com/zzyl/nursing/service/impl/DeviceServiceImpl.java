package com.zzyl.nursing.service.impl;

import cn.hutool.json.JSONUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.huaweicloud.sdk.iotda.v5.IoTDAClient;
import com.huaweicloud.sdk.iotda.v5.model.ListProductsRequest;
import com.huaweicloud.sdk.iotda.v5.model.ListProductsResponse;
import com.zzyl.common.exception.base.BaseException;
import com.zzyl.common.utils.StringUtils;
import com.zzyl.nursing.domain.Device;
import com.zzyl.nursing.domain.vo.ProductVO;
import com.zzyl.nursing.mapper.DeviceMapper;
import com.zzyl.nursing.service.IDeviceService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Collections;
import java.util.List;
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
}