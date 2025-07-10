package com.zzyl.serve.controller;

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
import com.zzyl.common.core.domain.R;
import com.zzyl.common.enums.BusinessType;
import com.zzyl.serve.domain.NursingLevel;
import com.zzyl.serve.service.INursingLevelService;
import com.zzyl.common.utils.poi.ExcelUtil;
import com.zzyl.common.core.page.TableDataInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;

/**
 * 护理等级Controller
 * 
 * @author Adrian
 * @date 2025-07-09
 */
@RestController
@RequestMapping("/serve/level")
@Api(tags = "护理等级管理")
public class NursingLevelController extends BaseController
{
    @Autowired
    private INursingLevelService nursingLevelService;

    /**
     * 查询护理等级列表
     */
    @PreAuthorize("@ss.hasPermi('serve:level:list')")
    @GetMapping("/list")
    @ApiOperation(value = "查询护理等级列表", notes = "根据护理等级条件查询护理等级列表")
    public TableDataInfo list(
            @ApiParam(value = "护理等级查询条件", required = false) NursingLevel nursingLevel)
    {
        startPage();
        List<NursingLevel> list = nursingLevelService.selectNursingLevelList(nursingLevel);
        return getDataTable(list);
    }

    /**
     * 导出护理等级列表
     */
    @PreAuthorize("@ss.hasPermi('serve:level:export')")
    @Log(title = "护理等级", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ApiOperation("导出护理等级数据到Excel")
    public void export(
            @ApiParam(name = "response", value = "HTTP响应对象，用于输出Excel文件") HttpServletResponse response,
            @ApiParam(name = "nursingLevel", value = "护理等级实体类，用于条件筛选") NursingLevel nursingLevel)
    {
        List<NursingLevel> list = nursingLevelService.selectNursingLevelList(nursingLevel);
        ExcelUtil<NursingLevel> util = new ExcelUtil<NursingLevel>(NursingLevel.class);
        util.exportExcel(response, list, "护理等级数据");
    }

    /**
     * 获取护理等级详细信息
     */
    @PreAuthorize("@ss.hasPermi('serve:level:query')")
    @GetMapping(value = "/{id}")
    @ApiOperation(value = "获取护理等级详细信息", notes = "根据ID获取护理等级详细信息")
    @ApiImplicitParam(name = "id", value = "护理等级ID", required = true, dataType = "Long", paramType = "path")
    public R<NursingLevel> getInfo(@PathVariable("id") Long id)
    {
        NursingLevel nursingLevel = nursingLevelService.selectNursingLevelById(id);
        return R.ok(nursingLevel);
    }

    /**
     * 新增护理等级
     */
    @PreAuthorize("@ss.hasPermi('serve:level:add')")
    @Log(title = "护理等级", businessType = BusinessType.INSERT)
    @PostMapping
    @ApiOperation("新增护理等级")
    public AjaxResult add(
            @ApiParam(name = "nursingLevel", value = "护理等级实体类，包含新增数据", required = true) @RequestBody NursingLevel nursingLevel)
    {
        return toAjax(nursingLevelService.insertNursingLevel(nursingLevel));
    }

    /**
     * 修改护理等级
     */
    @PreAuthorize("@ss.hasPermi('serve:level:edit')")
    @Log(title = "护理等级", businessType = BusinessType.UPDATE)
    @PutMapping
    @ApiOperation("修改护理等级")
    public AjaxResult edit(
            @ApiParam(name = "nursingLevel", value = "护理等级实体类，包含修改数据", required = true) @RequestBody NursingLevel nursingLevel)
    {
        return toAjax(nursingLevelService.updateNursingLevel(nursingLevel));
    }

    /**
     * 删除护理等级
     */
    @PreAuthorize("@ss.hasPermi('serve:level:remove')")
    @Log(title = "护理等级", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    @ApiOperation("删除护理等级（支持批量）")
    public AjaxResult remove(
            @ApiParam(name = "ids", value = "护理等级ID数组，表示要删除的多个等级", required = true) @PathVariable Long[] ids)
    {
        return toAjax(nursingLevelService.deleteNursingLevelByIds(ids));
    }
}
