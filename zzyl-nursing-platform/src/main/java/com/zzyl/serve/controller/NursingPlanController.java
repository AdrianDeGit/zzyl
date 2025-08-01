package com.zzyl.serve.controller;

import com.zzyl.serve.domain.dto.NursingPlanDTO;
import com.zzyl.serve.vo.NursingPlanVO;
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
import com.zzyl.serve.domain.NursingPlan;
import com.zzyl.serve.service.INursingPlanService;
import com.zzyl.common.utils.poi.ExcelUtil;
import com.zzyl.common.core.page.TableDataInfo;

/**
 * 护理计划Controller
 *
 * @author Adrian
 * @date 2025-07-11
 */
@RestController
@RequestMapping("/serve/plan")
@Api(tags = "护理计划相关接口")
public class NursingPlanController extends BaseController {
    @Autowired
    private INursingPlanService nursingPlanService;

    /**
     * 查询护理计划列表
     */
    @PreAuthorize("@ss.hasPermi('serve:plan:list')")
    @GetMapping("/list")
    @ApiOperation("查询护理计划列表")
    public TableDataInfo<List<NursingPlan>> list(NursingPlan nursingPlan) {
        startPage();
        List<NursingPlan> list = nursingPlanService.selectNursingPlanList(nursingPlan);
        return getDataTable(list);
    }

    @ApiOperation(value = "获取所有护理计划")
    @GetMapping("/all")
    public R<List<NursingPlan>> listAll() {
        List<NursingPlan> list = nursingPlanService.selectNursingPlanList(new NursingPlan());
        return R.ok(list);
    }

    /**
     * 导出护理计划列表
     */
    @PreAuthorize("@ss.hasPermi('serve:plan:export')")
    @Log(title = "护理计划", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ApiOperation("导出护理计划列表")
    public void export(HttpServletResponse response, NursingPlan nursingPlan) {
        List<NursingPlan> list = nursingPlanService.selectNursingPlanList(nursingPlan);
        ExcelUtil<NursingPlan> util = new ExcelUtil<NursingPlan>(NursingPlan.class);
        util.exportExcel(response, list, "护理计划数据");
    }

    /**
     * 获取护理计划详细信息
     */
    @PreAuthorize("@ss.hasPermi('serve:plan:query')")
    @GetMapping(value = "/{id}")
    @ApiOperation("获取护理计划详细信息")
    public R<NursingPlanVO> getInfo(@ApiParam(value = "护理计划ID", required = true)
                                  @PathVariable("id") Integer id) {
        return R.ok(nursingPlanService.selectNursingPlanById(id));
    }

    /**
     * 新增护理计划
     */
    @PreAuthorize("@ss.hasPermi('serve:plan:add')")
    @Log(title = "护理计划", businessType = BusinessType.INSERT)
    @PostMapping
    @ApiOperation("新增护理计划")
    public AjaxResult add(@ApiParam(value = "护理计划实体", required = true) @RequestBody NursingPlanDTO nursingPlanDTO) {
        return toAjax(nursingPlanService.insertNursingPlan(nursingPlanDTO));
    }

    /**
     * 修改护理计划
     */
    @PreAuthorize("@ss.hasPermi('serve:plan:edit')")
    @Log(title = "护理计划", businessType = BusinessType.UPDATE)
    @PutMapping
    @ApiOperation("修改护理计划")
    public AjaxResult edit(@ApiParam(value = "护理计划实体", required = true) @RequestBody NursingPlanDTO nursingPlanDTO) {
        return toAjax(nursingPlanService.updateNursingPlan(nursingPlanDTO));
    }

    /**
     * 删除护理计划
     */
    @PreAuthorize("@ss.hasPermi('serve:plan:remove')")
    @Log(title = "护理计划", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    @ApiOperation("删除护理计划")
    public AjaxResult remove(@ApiParam(value = "护理计划IDS", required = true) @PathVariable Long[] ids) {
        return toAjax(nursingPlanService.deleteNursingPlanByIds(ids));
    }
}