package com.zzyl.nursing.domain.vo;


import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * @Date: 2025/7/23 18:21
 * @Author: Adrian
 * @Version: 1.0
 * @Description:
 */
@Data
@ApiModel("设备详细信息")
public class DeviceDetailVO {
    /**
     * 设备id
     */
    @ApiModelProperty(value = "设备id")
    private Long id;

    /**
     * 物联网设备id
     */
    @ApiModelProperty(value = "物联网设备id")
    private String iotId;

    /**
     * 设备名称
     */
    @ApiModelProperty(value = "设备名称")
    private String deviceName;

    /**
     * 设备标识码
     */
    @ApiModelProperty(value = "设备标识码")
    private String nodeId;

    /**
     * 设备秘钥
     */
    @ApiModelProperty(value = "设备秘钥")
    private String secret;

    /**
     * 产品id
     */
    @ApiModelProperty(value = "产品id")
    public String productKey;

    /**
     * 产品名称
     */
    @ApiModelProperty(value = "产品名称")
    public String productName;

    /**
     * 位置类型 0 随身设备 1固定设备
     */
    @ApiModelProperty(value = "位置类型 0 随身设备 1固定设备")
    private Integer locationType;

    /**
     * 绑定位置,如果是随身设备为老人id，如果是固定设备为位置的最后一级id
     */
    @ApiModelProperty(value = "绑定位置,如果是随身设备为老人id，如果是固定设备为位置的最后一级id")
    private Long bindingLocation;


    /**
     * 接入位置
     */
    @ApiModelProperty(value = "接入位置")
    private String remark;

    /**
     * 设备状态，ONLINE：设备在线，OFFLINE：设备离线，ABNORMAL：设备异常，INACTIVE：设备未激活，FROZEN：设备冻结
     */
    @ApiModelProperty(value = "设备状态，ONLINE：设备在线，OFFLINE：设备离线，ABNORMAL：设备异常，INACTIVE：设备未激活，FROZEN：设备冻结")
    private String deviceStatus;

    /**
     * 激活时间
     */
    @ApiModelProperty(value = "激活时间,格式：yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private LocalDateTime activeTime;

    /**
     * 创建时间
     */
    @ApiModelProperty(value = "创建时间,格式：yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private LocalDateTime createTime;

    /**
     * 创建人id
     */
    @ApiModelProperty(value = "创建人id")
    private Long createBy;

    /**
     * 创建人名称
     */
    @ApiModelProperty(value = "创建人名称")
    private String creator;

    /**
     * 位置备注
     */
    @ApiModelProperty(value = "位置备注")
    private String deviceDescription;
}
