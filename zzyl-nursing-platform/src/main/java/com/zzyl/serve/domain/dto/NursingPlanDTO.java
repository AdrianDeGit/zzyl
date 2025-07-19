package com.zzyl.serve.domain.dto;

import com.zzyl.serve.domain.NursingProjectPlan;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.List;

/**
 * @Date: 2025/7/13 20:24
 * @Author: Adrian
 * @Version: 1.0
 * @Description:
 */
@Data
public class NursingPlanDTO {


    private Long id;

    /**
     * 排序号
     */
    @ApiModelProperty(value = "排序号")
    private Integer sortNo;

    /**
     * 计划名称
     */
    @ApiModelProperty(value = "计划名称")
    private String planName;

    /**
     * 状态（0：禁用，1：启用）
     */
    @ApiModelProperty(value = "状态（0：禁用，1：启用）")
    private Integer status;

    /**
     * 护理计划关联项目列表
     */
    List<NursingProjectPlan> projectPlans;
}
