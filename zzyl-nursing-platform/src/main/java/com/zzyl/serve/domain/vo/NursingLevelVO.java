package com.zzyl.serve.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.zzyl.common.annotation.Excel;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

@Data
@ApiModel(description = "护理等级")
public class NursingLevelVO {
    /**
     * 等级名称
     */
    @ApiModelProperty(value = "等级名称")
    private String name;

    /**
     * 护理计划名称
     */
    @ApiModelProperty(value = "护理计划名称")
    private String planName;

    /**
     * 护理计划ID
     */
    @Excel(name = "护理计划ID")
    @ApiModelProperty(value = "护理计划ID")
    private Long lplanId;

    /**
     * 护理费用
     */
    @ApiModelProperty(value = "护理费用")
    private BigDecimal fee;
    /**
     * 状态（0：禁用，1：启用）
     */
    @ApiModelProperty(value = "状态")
    private Integer status;

    /**
     * 更新时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @ApiModelProperty(value = "更新时间")
    private Date updateTime;
}