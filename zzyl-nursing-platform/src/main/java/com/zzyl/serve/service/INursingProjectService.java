package com.zzyl.serve.service;

import java.util.List;
import com.zzyl.serve.domain.NursingProject;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zzyl.serve.domain.vo.NursingProjectVO;

/**
 * 护理项目Service接口
 * 
 * @author Adrian
 * @date 2025-07-11
 */
public interface INursingProjectService extends IService<NursingProject>
{
    /**
     * 查询护理项目
     * 
     * @param id 护理项目主键
     * @return 护理项目
     */
    public NursingProject selectNursingProjectById(Long id);

    /**
     * 查询护理项目列表
     * 
     * @param nursingProject 护理项目
     * @return 护理项目集合
     */
    public List<NursingProject> selectNursingProjectList(NursingProject nursingProject);

    /**
     * 新增护理项目
     * 
     * @param nursingProject 护理项目
     * @return 结果
     */
    public int insertNursingProject(NursingProject nursingProject);

    /**
     * 修改护理项目
     * 
     * @param nursingProject 护理项目
     * @return 结果
     */
    public int updateNursingProject(NursingProject nursingProject);

    /**
     * 批量删除护理项目
     * 
     * @param ids 需要删除的护理项目主键集合
     * @return 结果
     */
    public int deleteNursingProjectByIds(Long[] ids);

    /**
     * 删除护理项目信息
     * 
     * @param id 护理项目主键
     * @return 结果
     */
    public int deleteNursingProjectById(Long id);

    /**
     * 查询所有护理项目
     * @return
     */
    List<NursingProjectVO> selectAll();
}
