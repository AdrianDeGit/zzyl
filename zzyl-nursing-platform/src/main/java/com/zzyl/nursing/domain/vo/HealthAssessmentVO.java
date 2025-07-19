package com.zzyl.nursing.domain.vo;

import lombok.Data;

/**
 *  健康评估类
 * @author itheima
 */
@Data
public class HealthAssessmentVO {
    /**
     * 健康风险等级
     */
    private String riskLevel;
    /**
     * 健康指数
     */
    private double healthIndex;

}