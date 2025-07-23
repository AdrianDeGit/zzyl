package com.zzyl.nursing.controller;

import com.zzyl.common.core.controller.BaseController;
import com.zzyl.common.core.domain.AjaxResult;
import com.zzyl.common.core.page.TableDataInfo;
import com.zzyl.nursing.domain.Device;
import com.zzyl.nursing.domain.dto.DeviceDTO;
import com.zzyl.nursing.service.IDeviceService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * 设备Controller
 *
 * @author Adrian
 * @date 2025-07-23
 */
@RestController
@RequestMapping("/nursing/device")
@Api(tags = "设备相关接口")
public class DeviceController extends BaseController {
    @Resource
    private IDeviceService deviceService;

    /**
     * 查询设备列表
     *
     * @param device
     * @return
     */
    @PreAuthorize("@ss.hasPermi('nursing:device:list')")
    @GetMapping("/list")
    @ApiOperation("查询设备列表")
    public TableDataInfo<List<Device>> list(Device device) {
        startPage();
        List<Device> list = deviceService.selectDeviceList(device);
        return getDataTable(list);
    }

    /**
     * 从物联网平台同步产品列表
     *
     * @return
     */
    @PostMapping("/syncProductList")
    @ApiOperation(value = "从物联网平台同步产品列表")
    public AjaxResult syncProductList() {
        deviceService.syncProductList();
        return success();
    }

    /**
     * 查询所有产品列表
     *
     * @return
     */
    @GetMapping("/allProduct")
    @ApiOperation(value = "查询所有产品列表")
    public AjaxResult allProduct() {
        return success(deviceService.allProduct());
    }

    /**
     * 注册设备
     *
     * @param deviceDTO
     * @return
     */
    @PostMapping("/register")
    @ApiOperation(value = "注册设备")
    public AjaxResult registerDevice(@RequestBody DeviceDTO deviceDTO) {
        deviceService.registerDevice(deviceDTO);
        return success();
    }
}