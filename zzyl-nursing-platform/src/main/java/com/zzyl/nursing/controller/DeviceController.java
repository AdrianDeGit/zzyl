package com.zzyl.nursing.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import com.zzyl.common.core.domain.R;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.zzyl.common.annotation.Log;
import com.zzyl.common.core.controller.BaseController;
import com.zzyl.common.core.domain.AjaxResult;
import com.zzyl.common.enums.BusinessType;
import com.zzyl.nursing.domain.Device;
import com.zzyl.nursing.service.IDeviceService;
import com.zzyl.common.utils.poi.ExcelUtil;
import com.zzyl.common.core.page.TableDataInfo;

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
    @Autowired
    private IDeviceService deviceService;

    /**
     * 查询设备列表
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
     * 导出设备列表
     */
    @PreAuthorize("@ss.hasPermi('nursing:device:export')")
    @Log(title = "设备", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ApiOperation("导出设备列表")
    public void export(HttpServletResponse response, Device device) {
        List<Device> list = deviceService.selectDeviceList(device);
        ExcelUtil<Device> util = new ExcelUtil<Device>(Device.class);
        util.exportExcel(response, list, "设备数据");
    }

    /**
     * 获取设备详细信息
     */
    @PreAuthorize("@ss.hasPermi('nursing:device:query')")
    @GetMapping(value = "/{id}")
    @ApiOperation("获取设备详细信息")
    public R<Device> getInfo(@ApiParam(value = "设备ID", required = true)
                             @PathVariable("id") Long id) {
        return R.ok(deviceService.selectDeviceById(id));
    }

    /**
     * 新增设备
     */
    @PreAuthorize("@ss.hasPermi('nursing:device:add')")
    @Log(title = "设备", businessType = BusinessType.INSERT)
    @PostMapping
    @ApiOperation("新增设备")
    public AjaxResult add(@ApiParam(value = "设备实体", required = true) @RequestBody Device device) {
        return toAjax(deviceService.insertDevice(device));
    }

    /**
     * 修改设备
     */
    @PreAuthorize("@ss.hasPermi('nursing:device:edit')")
    @Log(title = "设备", businessType = BusinessType.UPDATE)
    @PutMapping
    @ApiOperation("修改设备")
    public AjaxResult edit(@ApiParam(value = "设备实体", required = true) @RequestBody Device device) {
        return toAjax(deviceService.updateDevice(device));
    }

    /**
     * 删除设备
     */
    @PreAuthorize("@ss.hasPermi('nursing:device:remove')")
    @Log(title = "设备", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    @ApiOperation("删除设备")
    public AjaxResult remove(@ApiParam(value = "设备IDS", required = true) @PathVariable Long[] ids) {
        return toAjax(deviceService.deleteDeviceByIds(ids));
    }
}