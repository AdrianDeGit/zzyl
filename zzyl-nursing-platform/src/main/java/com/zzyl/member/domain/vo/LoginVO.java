package com.zzyl.member.domain.vo;


import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @Date: 2025/7/19 21:33
 * @Author: Adrian
 * @Version: 1.0
 * @Description:
 */
@Data
@ApiModel(value = "登录对象")
public class LoginVO {

    @ApiModelProperty(value = "JWT token")
    private String token;

    @ApiModelProperty(value = "昵称")
    private String nickName;
}