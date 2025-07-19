package com.zzyl.nursing.domain.vo;

import lombok.Data;

/**
 * 风险分布类
 * @author itheima
 */
@Data
public class RiskDistributionVO {
    /**
     * 健康
     */
    private double healthy;
    /**
     * 警告
     */
    private double caution;
    /**
     * 风险
     */
    private double risk;
    /**
     * 危险
     */
    private double danger;
    /**
     * 严重危险
     */
    private double severeDanger;

}