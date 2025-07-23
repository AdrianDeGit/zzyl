package com.zzyl.nursing.service;

import java.util.List;

import com.zzyl.common.core.domain.AjaxResult;
import com.zzyl.nursing.domain.Device;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zzyl.nursing.domain.dto.DeviceDTO;
import com.zzyl.nursing.domain.vo.DeviceDetailVO;
import com.zzyl.nursing.domain.vo.ProductVO;

/**
 * 设备Service接口
 *
 * @author Adrian
 * @date 2025-07-23
 */
public interface IDeviceService extends IService<Device> {
    /**
     * 查询设备
     *
     * @param id 设备主键
     * @return 设备
     */
    public Device selectDeviceById(Long id);

    /**
     * 查询设备列表
     *
     * @param device 设备
     * @return 设备集合
     */
    public List<Device> selectDeviceList(Device device);

    /**
     * 新增设备
     *
     * @param device 设备
     * @return 结果
     */
    public int insertDevice(Device device);

    /**
     * 修改设备
     *
     * @param device 设备
     * @return 结果
     */
    public int updateDevice(Device device);

    /**
     * 批量删除设备
     *
     * @param ids 需要删除的设备主键集合
     * @return 结果
     */
    public int deleteDeviceByIds(Long[] ids);

    /**
     * 删除设备信息
     *
     * @param id 设备主键
     * @return 结果
     */
    public int deleteDeviceById(Long id);

    /**
     * 从物联网平台同步产品列表
     */
    void syncProductList();

    /**
     * 查询所有产品列表
     *
     * @return 产品列表
     */
    List<ProductVO> allProduct();

    /**
     * 注册设备
     */
    void registerDevice(DeviceDTO deviceDTO);

    /**
     * 获取设备详细信息
     */
    DeviceDetailVO queryDeviceDetail(String iotId);

    /**
     * 查询设备上报数据
     */
    AjaxResult queryServiceProperties(String iotId);
}