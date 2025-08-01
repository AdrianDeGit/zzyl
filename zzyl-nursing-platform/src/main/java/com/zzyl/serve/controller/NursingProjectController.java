package com.zzyl.serve.controller;

import com.zzyl.serve.domain.vo.NursingProjectVO;
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
import com.zzyl.serve.domain.NursingProject;
import com.zzyl.serve.service.INursingProjectService;
import com.zzyl.common.utils.poi.ExcelUtil;
import com.zzyl.common.core.page.TableDataInfo;

/**
 * 护理项目Controller
 *
 * @author Adrian
 * @date 2025-07-11
 */
@RestController
@RequestMapping("/serve/project")
@Api(tags = "护理项目相关接口")
public class NursingProjectController extends BaseController {
    @Autowired
    private INursingProjectService nursingProjectService;

    /**
     * 查询护理项目列表
     */
    @PreAuthorize("@ss.hasPermi('serve:project:list')")
    @GetMapping("/list")
    @ApiOperation("查询护理项目列表")
    public TableDataInfo<List<NursingProject>> list(NursingProject nursingProject) {
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
    @ApiOperation("导出护理项目列表")
    public void export(HttpServletResponse response, NursingProject nursingProject) {
        List<NursingProject> list = nursingProjectService.selectNursingProjectList(nursingProject);
        ExcelUtil<NursingProject> util = new ExcelUtil<NursingProject>(NursingProject.class);
        util.exportExcel(response, list, "护理项目数据");
    }

    /**
     * 获取护理项目详细信息
     */
    @PreAuthorize("@ss.hasPermi('serve:project:query')")
    @GetMapping(value = "/{id}")
    @ApiOperation("获取护理项目详细信息")
    public R<NursingProject> getInfo(@ApiParam(value = "护理项目ID", required = true)
                                     @PathVariable("id") Long id) {
        return R.ok(nursingProjectService.selectNursingProjectById(id));
    }

    /**
     * 新增护理项目
     */
    @PreAuthorize("@ss.hasPermi('serve:project:add')")
    @Log(title = "护理项目", businessType = BusinessType.INSERT)
    @PostMapping
    @ApiOperation("新增护理项目")
    public AjaxResult add(@ApiParam(value = "护理项目实体", required = true) @RequestBody NursingProject nursingProject) {
        return toAjax(nursingProjectService.insertNursingProject(nursingProject));
    }

    /**
     * 修改护理项目
     */
    @PreAuthorize("@ss.hasPermi('serve:project:edit')")
    @Log(title = "护理项目", businessType = BusinessType.UPDATE)
    @PutMapping
    @ApiOperation("修改护理项目")
    public AjaxResult edit(@ApiParam(value = "护理项目实体", required = true) @RequestBody NursingProject nursingProject) {
        return toAjax(nursingProjectService.updateNursingProject(nursingProject));
    }

    /**
     * 删除护理项目
     */
    @PreAuthorize("@ss.hasPermi('serve:project:remove')")
    @Log(title = "护理项目", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    @ApiOperation("删除护理项目")
    public AjaxResult remove(@ApiParam(value = "护理项目IDS", required = true) @PathVariable Long[] ids) {
        return toAjax(nursingProjectService.deleteNursingProjectByIds(ids));
    }

    /**
     * 查询护理项目列表
     */
    @GetMapping("/all")
    @ApiOperation(value = "查询所有护理项目")
    public AjaxResult listAll() {
        List<NursingProjectVO> list = nursingProjectService.selectAll();
        return success(list);
    }
}