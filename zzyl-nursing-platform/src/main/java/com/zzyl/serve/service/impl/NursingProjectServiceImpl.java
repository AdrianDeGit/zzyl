package com.zzyl.serve.service.impl;

import java.util.List;

import com.zzyl.serve.vo.NursingProjectVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zzyl.serve.mapper.NursingProjectMapper;
import com.zzyl.serve.domain.NursingProject;
import com.zzyl.serve.service.INursingProjectService;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

/**
 * 护理项目Service业务层处理
 *
 * @author Adrian
 * @date 2025-07-11
 */
@Service
public class NursingProjectServiceImpl extends ServiceImpl<NursingProjectMapper, NursingProject> implements INursingProjectService
{
    @Autowired
    private NursingProjectMapper nursingProjectMapper;

    /**
     * 查询护理项目
     *
     * @param id 护理项目主键
     * @return 护理项目
     */
    @Override
    public NursingProject selectNursingProjectById(Long id)
    {
                return getById(id);
    }

    /**
     * 查询护理项目列表
     *
     * @param nursingProject 护理项目
     * @return 护理项目
     */
    @Override
    public List<NursingProject> selectNursingProjectList(NursingProject nursingProject)
    {
        return nursingProjectMapper.selectNursingProjectList(nursingProject);
    }

    /**
     * 新增护理项目
     *
     * @param nursingProject 护理项目
     * @return 结果
     */
    @Override
    public int insertNursingProject(NursingProject nursingProject)
    {
                // nursingProject.setCreateTime(DateUtils.getNowDate());
                        return save(nursingProject) ? 1 : 0;
    }

    /**
     * 修改护理项目
     *
     * @param nursingProject 护理项目
     * @return 结果
     */
    @Override
    public int updateNursingProject(NursingProject nursingProject)
    {
                // nursingProject.setUpdateTime(DateUtils.getNowDate());
                return updateById(nursingProject) ? 1 : 0;
    }

    /**
     * 批量删除护理项目
     *
     * @param ids 需要删除的护理项目主键
     * @return 结果
     */
    @Override
    public int deleteNursingProjectByIds(Long[] ids)
    {
        return nursingProjectMapper.deleteNursingProjectByIds(ids);
    }

    /**
     * 删除护理项目信息
     *
     * @param id 护理项目主键
     * @return 结果
     */
    @Override
    public int deleteNursingProjectById(Long id)
    {
                return removeById(id) ? 1 : 0;
    }

    /**
     * 查询所有护理项目
     *
     * @return
     */
    @Override
    public List<NursingProjectVO> selectAll() {
        return nursingProjectMapper.selectAll();
    }
}