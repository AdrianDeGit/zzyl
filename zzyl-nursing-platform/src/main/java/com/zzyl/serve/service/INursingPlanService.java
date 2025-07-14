package com.zzyl.serve.service;

import java.util.List;
import com.zzyl.serve.domain.NursingPlan;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zzyl.serve.dto.NursingPlanDTO;
import com.zzyl.serve.vo.NursingPlanVO;

/**
 * 护理计划Service接口
 * 
 * @author Adrian
 * @date 2025-07-11
 */
public interface INursingPlanService extends IService<NursingPlan>
{
    /**
     * 查询护理计划
     * 
     * @param id 护理计划主键
     * @return 护理计划
     */
    public NursingPlanVO selectNursingPlanById(Integer id);

    /**
     * 查询护理计划列表
     * 
     * @param nursingPlan 护理计划
     * @return 护理计划集合
     */
    public List<NursingPlan> selectNursingPlanList(NursingPlan nursingPlan);

    /**
     * 新增护理计划
     * 
     * @param nursingPlanDTO 护理计划
     * @return 结果
     */
    public int insertNursingPlan(NursingPlanDTO nursingPlanDTO);

    /**
     * 修改护理计划
     * 
     * @param nursingPlanDTO 护理计划
     * @return 结果
     */
    public int updateNursingPlan(NursingPlanDTO nursingPlanDTO);

    /**
     * 批量删除护理计划
     * 
     * @param ids 需要删除的护理计划主键集合
     * @return 结果
     */
    public int deleteNursingPlanByIds(Integer[] ids);

    /**
     * 删除护理计划信息
     * 
     * @param id 护理计划主键
     * @return 结果
     */
    public int deleteNursingPlanById(Integer id);
}
