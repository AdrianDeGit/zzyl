package com.zzyl.serve.vo;


import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.List;

/**
 * @Date: 2025/7/13 22:31
 * @Author: Adrian
 * @Version: 1.0
 * @Description:
 */
@Data
@ApiModel(description = "护理计划")
public class NursingPlanVO {

    /**
     * 护理计划id
     */
    private Long id;

    /**
     * 排序号
     */
    @ApiModelProperty(value = "护理计划排序号")
    private Integer sortNo;

    @ApiModelProperty(value = "护理计划名称")
    private String planName;

    @ApiModelProperty(value = "状态（0：禁用，1：启用）")
    private Integer status;

    @ApiModelProperty(value = "护理计划项目计划列表")
    List<NursingProjectPlanVO> projectPlans;

}