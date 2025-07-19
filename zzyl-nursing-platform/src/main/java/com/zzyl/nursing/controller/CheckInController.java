package com.zzyl.nursing.controller;

import com.zzyl.common.annotation.Log;
import com.zzyl.common.core.controller.BaseController;
import com.zzyl.common.core.domain.AjaxResult;
import com.zzyl.common.core.domain.R;
import com.zzyl.common.core.page.TableDataInfo;
import com.zzyl.common.enums.BusinessType;
import com.zzyl.common.utils.poi.ExcelUtil;
import com.zzyl.nursing.domain.CheckIn;
import com.zzyl.nursing.domain.dto.CheckInApplyDTO;
import com.zzyl.nursing.domain.vo.CheckInDetailVO;
import com.zzyl.nursing.service.ICheckInService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 入住Controller
 *
 * @author ruoyi
 * @date 2025-02-18
 */
@RestController
@RequestMapping("/nursing/checkIn")
@Api(tags = "入住相关接口")
public class CheckInController extends BaseController {
    @Autowired
    private ICheckInService checkInService;

    /**
     * 查询入住列表
     */
    @PreAuthorize("@ss.hasPermi('nursing:checkin:list')")
    @GetMapping("/list")
    @ApiOperation(value = "获取入住列表")
    public TableDataInfo<List<CheckIn>> list(CheckIn checkIn) {
        startPage();
        List<CheckIn> list = checkInService.selectCheckInList(checkIn);
        return getDataTable(list);
    }

    /**
     * 导出入住列表
     */
    @PreAuthorize("@ss.hasPermi('nursing:checkin:export')")
    @Log(title = "入住", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ApiOperation("导出入住列表")
    public void export(HttpServletResponse response, CheckIn checkIn) {
        List<CheckIn> list = checkInService.selectCheckInList(checkIn);
        ExcelUtil<CheckIn> util = new ExcelUtil<CheckIn>(CheckIn.class);
        util.exportExcel(response, list, "入住数据");
    }

    /**
     * 获取入住详细信息
     */
    @PreAuthorize("@ss.hasPermi('nursing:checkin:query')")
    @GetMapping(value = "/{id}")
    @ApiOperation("获取入住详细信息")
    public R<CheckIn> getInfo(@ApiParam(value = "入住ID", required = true)
                              @PathVariable("id") Long id) {
        return R.ok(checkInService.selectCheckInById(id));
    }

    /**
     * 新增入住
     */
    @PreAuthorize("@ss.hasPermi('nursing:checkin:add')")
    @Log(title = "入住", businessType = BusinessType.INSERT)
    @PostMapping
    @ApiOperation("新增入住")
    public AjaxResult add(@ApiParam(value = "入住实体", required = true) @RequestBody CheckIn checkIn) {
        return toAjax(checkInService.insertCheckIn(checkIn));
    }

    /**
     * 修改入住
     */
    @PreAuthorize("@ss.hasPermi('nursing:checkin:edit')")
    @Log(title = "入住", businessType = BusinessType.UPDATE)
    @PutMapping
    @ApiOperation("修改入住")
    public AjaxResult edit(@ApiParam(value = "入住实体", required = true) @RequestBody CheckIn checkIn) {
        return toAjax(checkInService.updateCheckIn(checkIn));
    }

    /**
     * 删除入住
     */
    @PreAuthorize("@ss.hasPermi('nursing:checkin:remove')")
    @Log(title = "入住", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    @ApiOperation("删除入住")
    public AjaxResult remove(@ApiParam(value = "要删除的数据id的数组") @PathVariable Long[] ids) {
        return toAjax(checkInService.deleteCheckInByIds(ids));
    }

    @PostMapping("/apply")
    public AjaxResult apply(@RequestBody CheckInApplyDTO checkInApplyDTO) {
        checkInService.apply(checkInApplyDTO);
        return AjaxResult.success();
    }

    @GetMapping("/detail/{id}")
    @ApiOperation("查询入住详情")
    public AjaxResult detail(@PathVariable("id") Long id){
        CheckInDetailVO checkInDetailVO = checkInService.detail(id);
        return success(checkInDetailVO);
    }
}
