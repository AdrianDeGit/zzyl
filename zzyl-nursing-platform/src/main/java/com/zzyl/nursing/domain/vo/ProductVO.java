package com.zzyl.nursing.domain.vo;


import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @Date: 2025/7/23 9:17
 * @Author: Adrian
 * @Version: 1.0
 * @Description:
 */
@Data
@ApiModel("产品信息响应模型")
public class ProductVO {
    /**
     * 产品的ProductKey,物联网平台产品唯一标识
     */
    @ApiModelProperty("产品的ProductKey,物联网平台产品唯一标识")
    private String productId;

    /**
     * 产品名称
     */
    @ApiModelProperty("产品名称")
    private String name;
}
