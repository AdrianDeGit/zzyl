package com.zzyl.serve.mapper;

import java.util.List;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import com.zzyl.serve.domain.NursingLevel;
import com.zzyl.serve.domain.vo.NursingLevelVO;
import org.apache.ibatis.annotations.Param;

/**
 * 护理等级Mapper接口
 * 
 * @author Adrian
 * @date 2025-07-11
 */
@Mapper
public interface NursingLevelMapper extends BaseMapper<NursingLevel>
{
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
     * 删除护理等级
     * 
     * @param id 护理等级主键
     * @return 结果
     */
    public int deleteNursingLevelById(Long id);

    /**
     * 批量删除护理等级
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteNursingLevelByIds(Long[] ids);

    /**
     * 查询护理等级VO列表
     * 
     * @param nursingLevel 护理等级
     * @return 护理等级VO集合
     */
    public List<NursingLevelVO> selectNursingLevelVOList(@Param("nursingLevel") com.zzyl.serve.domain.NursingLevel nursingLevel);
}
