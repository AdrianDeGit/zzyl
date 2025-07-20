package com.zzyl.member.domain.dto;


import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @Date: 2025/7/19 21:32
 * @Author: Adrian
 * @Version: 1.0
 * @Description:
 */
@Data
public class UserLoginRequestDTO {
    @ApiModelProperty("昵称")
    private String nickName;

    @ApiModelProperty("登录临时凭证")
    private String code;

    @ApiModelProperty("手机号临时凭证")
    private String phoneCode;
}
