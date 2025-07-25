package com.zzyl.serve.service;

import java.util.List;

import com.zzyl.serve.domain.NursingLevel;
import com.zzyl.serve.domain.vo.NursingLevelVO;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 护理等级Service接口
 *
 * @author Adrian
 * @date 2025-07-11
 */
public interface INursingLevelService extends IService<NursingLevel> {
    /**
     * 查询护理等级
     *
     * @param id 护理等级主键
     * @return 护理等级
     */
    public NursingLevel selectNursingLevelById(Long id);

    /**
     * 查询护理等级列表
     *
     * @param nursingLevel 护理等级
     * @return 护理等级集合
     */
    public List<NursingLevel> selectNursingLevelList(NursingLevel nursingLevel);

    /**
     * 新增护理等级
     *
     * @param nursingLevel 护理等级
     * @return 结果
     */
    public int insertNursingLevel(NursingLevel nursingLevel);

    /**
     * 修改护理等级
     *
     * @param nursingLevel 护理等级
     * @return 结果
     */
    public int updateNursingLevel(NursingLevel nursingLevel);

    /**
     * 批量删除护理等级
     *
     * @param ids 需要删除的护理等级主键集合
     * @return 结果
     */
    public int deleteNursingLevelByIds(Long[] ids);

    /**
     * 删除护理等级信息
     *
     * @param id 护理等级主键
     * @return 结果
     */
    public int deleteNursingLevelById(Long id);

    /**
     * 查询所有护理等级
     *
     * @return 护理等级列表
     */
    List<NursingLevel> listAll();

    /**
     * 查询护理等级VO列表
     *
     * @param nursingLevel 护理等级
     * @return 护理等级VO集合
     */
    List<NursingLevelVO> selectNursingLevelVOList(NursingLevel nursingLevel);
}
