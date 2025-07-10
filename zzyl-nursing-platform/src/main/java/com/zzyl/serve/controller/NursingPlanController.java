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
import com.zzyl.serve.domain.NursingPlan;
import com.zzyl.serve.service.INursingPlanService;
import com.zzyl.common.utils.poi.ExcelUtil;
import com.zzyl.common.core.page.TableDataInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;

/**
 * 护理计划Controller
 * 
 * @author Adrian
 * @date 2025-07-09
 */
@RestController
@RequestMapping("/serve/plan")
@Api(tags = "护理计划管理")
public class NursingPlanController extends BaseController
{
    @Autowired
    private INursingPlanService nursingPlanService;

    /**
     * 查询护理计划列表
     */
    @PreAuthorize("@ss.hasPermi('serve:plan:list')")
    @GetMapping("/list")
    @ApiOperation(value = "查询护理计划列表", notes = "根据护理计划条件查询护理计划列表")
    public TableDataInfo list(
            @ApiParam(value = "护理计划查询条件", required = false) NursingPlan nursingPlan)
    {
        startPage();
        List<NursingPlan> list = nursingPlanService.selectNursingPlanList(nursingPlan);
        return getDataTable(list);
    }

    /**
     * 导出护理计划列表
     */
    @PreAuthorize("@ss.hasPermi('serve:plan:export')")
    @Log(title = "护理计划", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ApiOperation("导出护理计划数据到Excel")
    public void export(
            @ApiParam(name = "response", value = "HTTP响应对象，用于输出Excel文件") HttpServletResponse response,
            @ApiParam(name = "nursingPlan", value = "护理计划实体类，用于条件筛选") NursingPlan nursingPlan)
    {
        List<NursingPlan> list = nursingPlanService.selectNursingPlanList(nursingPlan);
        ExcelUtil<NursingPlan> util = new ExcelUtil<NursingPlan>(NursingPlan.class);
        util.exportExcel(response, list, "护理计划数据");
    }

    /**
     * 获取护理计划详细信息
     */
    @PreAuthorize("@ss.hasPermi('serve:plan:query')")
    @GetMapping(value = "/{id}")
    @ApiOperation(value = "获取护理计划详细信息", notes = "根据ID获取护理计划详细信息")
    @ApiImplicitParam(name = "id", value = "护理计划ID", required = true, dataType = "Integer", paramType = "path")
    public R<NursingPlan> getInfo(@PathVariable("id") Integer id)
    {
        NursingPlan nursingPlan = nursingPlanService.selectNursingPlanById(id);
        return R.ok(nursingPlan);
    }

    /**
     * 新增护理计划
     */
    @PreAuthorize("@ss.hasPermi('serve:plan:add')")
    @Log(title = "护理计划", businessType = BusinessType.INSERT)
    @PostMapping
    @ApiOperation("新增护理计划")
    public AjaxResult add(
            @ApiParam(name = "nursingPlan", value = "护理计划实体类，包含新增数据", required = true) @RequestBody NursingPlan nursingPlan)
    {
        return toAjax(nursingPlanService.insertNursingPlan(nursingPlan));
    }

    /**
     * 修改护理计划
     */
    @PreAuthorize("@ss.hasPermi('serve:plan:edit')")
    @Log(title = "护理计划", businessType = BusinessType.UPDATE)
    @PutMapping
    @ApiOperation("修改护理计划")
    public AjaxResult edit(
            @ApiParam(name = "nursingPlan", value = "护理计划实体类，包含修改数据", required = true) @RequestBody NursingPlan nursingPlan)
    {
        return toAjax(nursingPlanService.updateNursingPlan(nursingPlan));
    }

    /**
     * 删除护理计划
     */
    @PreAuthorize("@ss.hasPermi('serve:plan:remove')")
    @Log(title = "护理计划", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    @ApiOperation("删除护理计划（支持批量）")
    public AjaxResult remove(
            @ApiParam(name = "ids", value = "护理计划ID数组，表示要删除的多个计划", required = true) @PathVariable Integer[] ids)
    {
        return toAjax(nursingPlanService.deleteNursingPlanByIds(ids));
    }
}
