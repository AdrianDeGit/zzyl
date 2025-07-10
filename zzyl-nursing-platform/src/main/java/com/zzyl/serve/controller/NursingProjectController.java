package com.zzyl.serve.controller;

import com.zzyl.common.annotation.Log;
import com.zzyl.common.core.controller.BaseController;
import com.zzyl.common.core.domain.AjaxResult;
import com.zzyl.common.core.domain.R;
import com.zzyl.common.core.page.TableDataInfo;
import com.zzyl.common.enums.BusinessType;
import com.zzyl.common.utils.poi.ExcelUtil;
import com.zzyl.serve.domain.NursingProject;
import com.zzyl.serve.service.INursingProjectService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

@RestController
@RequestMapping("/serve/project")
@Api(tags = "护理项目管理") // 控制器级别的标签描述
public class NursingProjectController extends BaseController {

    @Autowired
    private INursingProjectService nursingProjectService;

    /**
     * 查询护理项目列表
     */
    @PreAuthorize("@ss.hasPermi('serve:project:list')")
    @GetMapping("/list")
    @ApiOperation(value = "查询护理项目列表", notes = "根据护理项目条件查询护理项目列表")
    public TableDataInfo<List<NursingProject>> list(
            @ApiParam(value = "护理项目查询条件", required = false) NursingProject nursingProject)
    {
        startPage();
        List<NursingProject> list = nursingProjectService.selectNursingProjectList(nursingProject);
        return getDataTable(list);
    }

    /**
     * 导出护理项目列表
     */
    @PreAuthorize("@ss.hasPermi('serve:project:export')")
    @Log(title = "护理项目", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ApiOperation("导出护理项目数据到Excel")
    public void export(
            @ApiParam(name = "response", value = "HTTP响应对象，用于输出Excel文件") HttpServletResponse response,
            @ApiParam(name = "nursingProject", value = "护理项目实体类，用于条件筛选") NursingProject nursingProject) {
        List<NursingProject> list = nursingProjectService.selectNursingProjectList(nursingProject);
        ExcelUtil<NursingProject> util = new ExcelUtil(NursingProject.class);
        util.exportExcel(response, list, "护理项目数据");
    }

    /**
     * 获取护理项目详细信息
     */
    @PreAuthorize("@ss.hasPermi('serve:project:query')")
    @GetMapping(value = "/{id}")
    @ApiOperation(value = "获取护理项目详细信息", notes = "根据ID获取护理项目详细信息")
    @ApiImplicitParam(name = "id", value = "护理项目ID", required = true, dataType = "Long", paramType = "path")
    public R<NursingProject> getInfo(@PathVariable("id") Long id)
    {
        NursingProject nursingProject = nursingProjectService.selectNursingProjectById(id);
        return R.ok(nursingProject);
    }

    /**
     * 新增护理项目
     */
    @PreAuthorize("@ss.hasPermi('serve:project:add')")
    @Log(title = "护理项目", businessType = BusinessType.INSERT)
    @PostMapping
    @ApiOperation("新增护理项目")
    public AjaxResult add(
            @ApiParam(name = "nursingProject", value = "护理项目实体类，包含新增数据", required = true) @RequestBody NursingProject nursingProject) {
        return toAjax(nursingProjectService.insertNursingProject(nursingProject));
    }

    /**
     * 修改护理项目
     */
    @PreAuthorize("@ss.hasPermi('serve:project:edit')")
    @Log(title = "护理项目", businessType = BusinessType.UPDATE)
    @PutMapping
    @ApiOperation("修改护理项目")
    public AjaxResult edit(
            @ApiParam(name = "nursingProject", value = "护理项目实体类，包含修改数据", required = true) @RequestBody NursingProject nursingProject) {
        return toAjax(nursingProjectService.updateNursingProject(nursingProject));
    }

    /**
     * 删除护理项目
     */
    @PreAuthorize("@ss.hasPermi('serve:project:remove')")
    @Log(title = "护理项目", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    @ApiOperation("删除护理项目（支持批量）")
    public AjaxResult remove(
            @ApiParam(name = "ids", value = "护理项目ID数组，表示要删除的多个项目", required = true) @PathVariable Long[] ids) {
        return toAjax(nursingProjectService.deleteNursingProjectByIds(ids));
    }
}