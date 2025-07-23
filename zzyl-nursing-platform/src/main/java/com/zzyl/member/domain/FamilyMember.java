package com.zzyl.member.domain;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;
import com.zzyl.common.annotation.Excel;
import com.zzyl.common.core.domain.BaseEntity;

/**
 * 老人家属对象 family_member
 * 
 * @author ruoyi
 * @date 2025-02-24
 */
@EqualsAndHashCode(callSuper = true)
@Data
@NoArgsConstructor
@AllArgsConstructor
@ApiModel("老人家属实体")
@Builder
public class FamilyMember extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /**
    * 主键
    */
    @ApiModelProperty(value = "主键ID")
    private Long id;

    /**
    * 手机号
    */
    @Excel(name = "手机号")
    @ApiModelProperty(value = "手机号")
    private String phone;

    /**
    * 名称
    */
    @Excel(name = "名称")
    @ApiModelProperty(value = "名称")
    private String name;

    /**
    * 头像
    */
    @Excel(name = "头像")
    @ApiModelProperty(value = "头像")
    private String avatar;

    /**
    * OpenID
    */
    @Excel(name = "OpenID")
    @ApiModelProperty(value = "OpenID")
    private String openId;

    /**
    * 性别(0:男，1:女)
    */
    @Excel(name = "性别(0:男，1:女)")
    @ApiModelProperty(value = "性别(0:男，1:女)")
    private Integer gender;

}
