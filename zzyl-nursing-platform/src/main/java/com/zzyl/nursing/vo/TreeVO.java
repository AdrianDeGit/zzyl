package com.zzyl.nursing.vo;


import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.List;

/**
 * @Date: 2025/7/16 14:27
 * @Author: Adrian
 * @Version: 1.0
 * @Description:
 */
@Data
@ApiModel("树形结构VO")
public class TreeVO {
    /**
     * 菜单名称
     */
    @ApiModelProperty(value = "菜单名称")
    private String label;

    /**
     * 菜单ID
     */
    @ApiModelProperty(value = "菜单ID")
    private String value;

    /**
     * 子菜单
     */
    @ApiModelProperty(value = "子菜单")
    private List<TreeVO> children;
}
