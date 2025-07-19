package com.zzyl.nursing.domain.vo;

import lombok.Data;

/**
 * 异常数据类
 * @author itheima
 */
@Data
public class AbnormalDataVO {
    /**
     * 结论
     */
    private String conclusion;
    /**
     * 检查项目
     */
    private String examinationItem;
    /**
     * 结果
     */
    private String result;
    /**
     * 参考值
     */
    private String referenceValue;
    /**
     * 单位
     */
    private String unit;
    /**
     * 结果解释
     */
    private String interpret;
    /**
     * 建议
     */
    private String advice;

}