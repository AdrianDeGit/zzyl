package com.zzyl.nursing.controller;

import com.zzyl.common.annotation.Log;
import com.zzyl.common.core.controller.BaseController;
import com.zzyl.common.core.domain.AjaxResult;
import com.zzyl.common.core.domain.R;
import com.zzyl.common.core.page.TableDataInfo;
import com.zzyl.common.enums.BusinessType;
import com.zzyl.common.utils.poi.ExcelUtil;
import com.zzyl.nursing.domain.RoomType;
import com.zzyl.nursing.service.IRoomTypeService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 房型Controller
 * 
 * @author ruoyi
 * @date 2024-04-26
 */
@RestController
@RequestMapping("/elder/roomType")
@Api(tags =  "房型相关接口")
public class RoomTypeController extends BaseController
{
    @Autowired
    private IRoomTypeService roomTypeService;

    /**
     * 查询房型列表
     */
    @PreAuthorize("@ss.hasPermi('elder:roomType:list')")
    @GetMapping("/list")
    @ApiOperation("查询房型列表")
    public TableDataInfo list(RoomType roomType)
    {
        startPage();
        List<RoomType> list = roomTypeService.selectRoomTypeList(roomType);
        return getDataTable(list);
    }

    /**
     * 查询房型列表
     */
    @PreAuthorize("@ss.hasPermi('elder:roomType:list')")
    @GetMapping("/listAll")
    @ApiOperation("查询所有房型列表")
    public AjaxResult list()
    {
        List<RoomType> list = roomTypeService.list();
        return success(list);
    }

    /**
     * 导出房型列表
     */
    @PreAuthorize("@ss.hasPermi('elder:roomType:export')")
    @Log(title = "房型", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, RoomType roomType)
    {
        List<RoomType> list = roomTypeService.selectRoomTypeList(roomType);
        ExcelUtil<RoomType> util = new ExcelUtil<RoomType>(RoomType.class);
        util.exportExcel(response, list, "房型数据");
    }

    /**
     * 获取房型详细信息
     */
    @PreAuthorize("@ss.hasPermi('elder:roomType:query')")
    @GetMapping(value = "/{id}")
    @ApiOperation("获取房型详细信息")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(roomTypeService.selectRoomTypeById(id));
    }

    /**
     * 新增房型
     */
    @PreAuthorize("@ss.hasPermi('elder:roomType:add')")
    @Log(title = "房型", businessType = BusinessType.INSERT)
    @PostMapping
    @ApiOperation("新增房型")
    public AjaxResult add(@RequestBody RoomType roomType)
    {
        return toAjax(roomTypeService.insertRoomType(roomType));
    }

    /**
     * 修改房型
     */
    @ApiOperation("修改房型")
    @PreAuthorize("@ss.hasPermi('elder:roomType:edit')")
    @Log(title = "房型", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody RoomType roomType)
    {
        return toAjax(roomTypeService.updateRoomType(roomType));
    }

    /**
     * 删除房型
     */
    @ApiOperation("删除房型")
    @PreAuthorize("@ss.hasPermi('elder:roomType:remove')")
    @Log(title = "房型", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(roomTypeService.deleteRoomTypeByIds(ids));
    }
}
