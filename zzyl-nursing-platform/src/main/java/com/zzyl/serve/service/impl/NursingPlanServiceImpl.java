package com.zzyl.serve.service.impl;

import java.util.List;
import java.util.concurrent.TimeUnit;

import com.zzyl.common.utils.DateUtils;
import com.zzyl.common.utils.bean.BeanUtils;
import com.zzyl.serve.mapper.NursingProjectPlanMapper;
import com.zzyl.serve.dto.NursingPlanDTO;
import com.zzyl.serve.vo.NursingPlanVO;
import com.zzyl.serve.vo.NursingProjectPlanVO;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import com.zzyl.serve.mapper.NursingPlanMapper;
import com.zzyl.serve.domain.NursingPlan;
import com.zzyl.serve.service.INursingPlanService;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import javax.annotation.Resource;

/**
 * 护理计划Service业务层处理
 *
 * @author Adrian
 * @date 2025-07-11
 */
@Service
public class NursingPlanServiceImpl extends ServiceImpl<NursingPlanMapper, NursingPlan> implements INursingPlanService {
    @Autowired
    private NursingPlanMapper nursingPlanMapper;

    @Resource
    private NursingProjectPlanMapper nursingProjectPlanMapper;

    @Resource
    private RedisTemplate<Object, Object> redisTemplate;

    private static final String CACHE_KEY_PREFIX = "nursingPlan:all";


    /**
     * 查询护理计划
     *
     * @param id 护理计划主键
     * @return 护理计划
     */
    @Override
    public NursingPlanVO selectNursingPlanById(Integer id) {
        // 1.根据id查询护理计划
        NursingPlan nursingPlan = nursingPlanMapper.selectNursingPlanById(id);
        NursingPlanVO nursingPlanVO = new NursingPlanVO();
        BeanUtils.copyProperties(nursingPlan, nursingPlanVO);

        // 2.根据护理计划id查询关联的所有护理项目
        List<NursingProjectPlanVO> list = nursingProjectPlanMapper.selectByPlanId(id);

        nursingPlanVO.setProjectPlans(list);
        return nursingPlanVO;
    }

    /**
     * 查询护理计划列表
     *
     * @param nursingPlan 护理计划
     * @return 护理计划
     */
    @Override
    public List<NursingPlan> selectNursingPlanList(NursingPlan nursingPlan) {
        List<NursingPlan> nursingPlanList = (List<NursingPlan>) redisTemplate.opsForValue().get(CACHE_KEY_PREFIX);
        if (nursingPlanList != null && !nursingPlanList.isEmpty()) {
            return nursingPlanList;
        }
        List<NursingPlan> nursingPlanListDB = nursingPlanMapper.selectNursingPlanList(nursingPlan);
        redisTemplate.opsForValue().set(CACHE_KEY_PREFIX, nursingPlanListDB, 60 * 60 * 24 + (int) (Math.random() * 100), TimeUnit.SECONDS);
        return nursingPlanListDB;
    }

    /**
     * 新增护理计划
     *
     * @param nursingPlanDTO 护理计划
     * @return 结果
     */
    @Override
    public int insertNursingPlan(NursingPlanDTO nursingPlanDTO) {
        // 保存护理计划
        // 属性拷贝
        NursingPlan nursingPlan = new NursingPlan();
        BeanUtils.copyProperties(nursingPlanDTO, nursingPlan);
        nursingPlan.setCreateTime(DateUtils.getNowDate());
        nursingPlanMapper.insertNursingPlan(nursingPlan);

        // 批量保存护理项目计划关系
        int count = nursingProjectPlanMapper.batchInsert(nursingPlanDTO.getProjectPlans(), nursingPlan.getId());

        deleteCache();
        return count == 0 ? 0 : 1;
    }

    /**
     * 修改护理计划
     *
     * @param nursingPlanDTO 护理计划
     * @return 结果
     */
    @Override
    public int updateNursingPlan(NursingPlanDTO nursingPlanDTO) {
        try {
            // 属性拷贝
            NursingPlan nursingPlan = new NursingPlan();
            BeanUtils.copyProperties(nursingPlanDTO, nursingPlan);

            // 判断dto中的项目列表为空，如果不为空，则先删除护理计划与护理项目的关系，然后重新批量添加
            if (nursingPlanDTO.getProjectPlans() != null && !nursingPlanDTO.getProjectPlans().isEmpty()) {
                // 删除护理计划对应的护理项目列表
                nursingProjectPlanMapper.deleteByPlanId(nursingPlan.getId());
                // 批量保存护理计划对应的护理项目列表
                nursingProjectPlanMapper.batchInsert(nursingPlanDTO.getProjectPlans(), nursingPlan.getId());
            }

            // 不管项目列表是否为空，都要修改护理计划
            int updated = nursingPlanMapper.updateNursingPlan(nursingPlan);
            deleteCache();
            return updated;
        } catch (BeansException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 批量删除护理计划
     *
     * @param ids 需要删除的护理计划主键
     * @return 结果
     */
    @Override
    public int deleteNursingPlanByIds(Long[] ids) {
        nursingProjectPlanMapper.deleteNursingProjectPlanByIds(ids);
        int result = nursingPlanMapper.deleteNursingPlanByIds(ids);
        deleteCache();
        return result;
    }

    /**
     * 删除护理计划信息
     *
     * @param id 护理计划主键
     * @return 结果
     */
    @Override
    public int deleteNursingPlanById(Integer id) {
        boolean b = removeById(id);
        deleteCache();
        return b ? 1 : 0;
    }

    /**
     * 删除Redis缓存数据
     */
    private void deleteCache() {
        redisTemplate.delete(CACHE_KEY_PREFIX);
    }
}