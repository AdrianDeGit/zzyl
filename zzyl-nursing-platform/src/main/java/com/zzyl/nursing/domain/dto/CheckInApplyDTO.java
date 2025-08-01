package com.zzyl.nursing.domain.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.List;

/**
 * 申请入住请求模型
 *
 * @author itcast
 * @create 2023/12/18 17:10
 **/
@ApiModel(description = "申请入住请求模型")
@Data
public class CheckInApplyDTO {

    /**
     * 老人信息
     */
    @ApiModelProperty(value = "老人信息")
    private CheckInElderDTO checkInElderDTO;

    /**
     * 家属信息
     */
    @ApiModelProperty(value = "家属信息")
    private List<ElderFamilyDTO> elderFamilyDTOList;

    /**
     * 入住配置
     */
    @ApiModelProperty(value = "入住配置")
    private CheckInConfigDTO checkInConfigDTO;

    /**
     * 签约办理
     */
    @ApiModelProperty(value = "签约办理")
    private CheckInContractDTO checkInContractDTO;
}
