package com.zzyl.nursing.domain.vo;

import lombok.Data;

import java.util.List;

/**
 * 体检报告
 * @author itheima
 */
@Data
public class HealthReportVO {

    /**
     * 体检日期
     */
    private String totalCheckDate;
    /**
     * 健康评估
     */
    private HealthAssessmentVO healthAssessment;
    /**
     * 风险分布
     */
    private RiskDistributionVO riskDistribution;
    /**
     * 异常数据列表
     */
    private List<AbnormalDataVO> abnormalData;

    /**
     * 健康系统分值
     */
    private SystemScore systemScore;

    /**
     * 综合总结
     */
    private String summarize;
}
