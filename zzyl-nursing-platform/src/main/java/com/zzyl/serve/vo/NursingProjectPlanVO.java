package com.zzyl.serve.vo;


import com.zzyl.common.annotation.Excel;
import lombok.Data;

/**
 * @Date: 2025/7/13 22:32
 * @Author: Adrian
 * @Version: 1.0
 * @Description:
 */
@Data
public class NursingProjectPlanVO {
    private Long id;

    /**
     * 项目id
     */
    private String projectId;

    /**
     * 计划id
     */
    @Excel(name = "计划id")
    private Long planId;

    /**
     * 计划执行时间
     */
    @Excel(name = "计划执行时间")
    private String executeTime;

    /**
     * 执行周期 0 天 1 周 2月
     */
    @Excel(name = "执行周期 0 天 1 周 2月")
    private String executeCycle;

    /**
     * 执行频次
     */
    @Excel(name = "执行频次")
    private Long executeFrequency;
}
