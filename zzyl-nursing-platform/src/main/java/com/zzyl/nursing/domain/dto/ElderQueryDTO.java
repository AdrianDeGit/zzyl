package com.zzyl.nursing.domain.dto;


import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @Date: 2025/7/23 10:34
 * @Author: Adrian
 * @Version: 1.0
 * @Description:
 */
@Data
@ApiModel("老人条件查询参数")
public class ElderQueryDTO{
    @ApiModelProperty(value = "老人姓名")
    private String name;
    @ApiModelProperty(value = "老人身份证号")
    private String idCardNo;
    @ApiModelProperty(value = "老人状态")
    private Integer status;
    @ApiModelProperty(value = "当前页数")
    private Integer pageNum;
    @ApiModelProperty(value = "每页显示条数")
    private Integer pageSize;
}