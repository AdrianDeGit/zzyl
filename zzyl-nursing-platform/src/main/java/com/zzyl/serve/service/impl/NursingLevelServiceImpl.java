package com.zzyl.serve.service.impl;

import java.util.List;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.zzyl.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import com.zzyl.serve.mapper.NursingLevelMapper;
import com.zzyl.serve.domain.NursingLevel;
import com.zzyl.serve.service.INursingLevelService;
import com.zzyl.serve.domain.vo.NursingLevelVO;

import com.zzyl.serve.mapper.NursingLevelMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import java.util.Arrays;
import java.util.concurrent.TimeUnit;

/**
 * 护理等级Service业务层处理
 *
 * @author Adrian
 * @date 2025-07-11
 */
@Service
public class NursingLevelServiceImpl extends ServiceImpl<NursingLevelMapper, NursingLevel> implements INursingLevelService {
    @Autowired
    private NursingLevelMapper nursingLevelMapper;

    @Autowired
    private RedisTemplate<Object, Object> redisTemplate;

    private static final String CACHE_KEY_PREFIX = "nursingLevel:all";

    /**
     * 查询护理等级
     *
     * @param id 护理等级主键
     * @return 护理等级
     */
    @Override
    public NursingLevel selectNursingLevelById(Long id) {
        return getById(id);
    }

    /**
     * 查询护理等级列表
     *
     * @param nursingLevel 护理等级
     * @return 护理等级
     */
    @Override
    public List<NursingLevel> selectNursingLevelList(NursingLevel nursingLevel) {
        return nursingLevelMapper.selectNursingLevelList(nursingLevel);
    }

    /**
     * 新增护理等级
     *
     * @param nursingLevel 护理等级
     * @return 结果
     */
    @Override
    public int insertNursingLevel(NursingLevel nursingLevel) {
        // nursingLevel.setCreateTime(DateUtils.getNowDate());
        // return save(nursingLevel) ? 1 : 0;
        int flag = nursingLevelMapper.insertNursingLevel(nursingLevel);
        // 删除缓存
        deleteCache();
        return flag;
    }

    /**
     * 修改护理等级
     *
     * @param nursingLevel 护理等级
     * @return 结果
     */
    @Override
    public int updateNursingLevel(NursingLevel nursingLevel) {
        nursingLevel.setUpdateTime(DateUtils.getNowDate());
        // return updateById(nursingLevel) ? 1 : 0;
        int flag = nursingLevelMapper.updateNursingLevel(nursingLevel);
        deleteCache();
        return flag;
    }

    /**
     * 批量删除护理等级
     *
     * @param ids 需要删除的护理等级主键
     * @return 结果
     */
    @Override
    public int deleteNursingLevelByIds(Long[] ids) {
        // return nursingLevelMapper.deleteNursingLevelByIds(ids);
        int flag = nursingLevelMapper.deleteNursingLevelByIds(ids);
        deleteCache();
        return flag;
    }

    /**
     * 删除护理等级信息
     *
     * @param id 护理等级主键
     * @return 结果
     */
    @Override
    public int deleteNursingLevelById(Long id) {
        // return removeById(id) ? 1 : 0;
        int flag = nursingLevelMapper.deleteNursingLevelById(id);
        deleteCache();
        return flag;
    }

    /**
     * 查询所有护理等级
     *
     * @return 护理等级列表
     */
    @Override
    public List<NursingLevel> listAll() {
        // LambdaQueryWrapper<NursingLevel> queryWrapper = new LambdaQueryWrapper<>();
        // queryWrapper.eq(NursingLevel::getStatus, 1)
        //         .orderByAsc(NursingLevel::getName);
        // return list(queryWrapper);
        // 从缓存中获取
        List<NursingLevel> list = (List<NursingLevel>) redisTemplate.opsForValue().get(CACHE_KEY_PREFIX);
        // 缓存中有数据，直接返回
        if (list != null && !list.isEmpty()) {
            return list;
        }

        // 从数据库查询
        LambdaQueryWrapper<NursingLevel> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(NursingLevel::getStatus, 1);
        list = list(queryWrapper);

        // 将数据写入缓存
        redisTemplate.opsForValue().set(CACHE_KEY_PREFIX, list, 60 * 60 * 24 + (int) (Math.random() * 100), TimeUnit.SECONDS);

        return list;
    }

    /**
     * 查询护理等级VO列表
     *
     * @param nursingLevel 护理等级
     * @return 护理等级VO列表
     */
    @Override
    public List<NursingLevelVO> selectNursingLevelVOList(NursingLevel nursingLevel) {
        return nursingLevelMapper.selectNursingLevelVOList(nursingLevel);
    }

    /**
     * 删除Redis缓存数据
     */
    private void deleteCache() {
        // 删除缓存
        redisTemplate.delete(CACHE_KEY_PREFIX);
    }

}