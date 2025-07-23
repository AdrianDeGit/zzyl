package com.zzyl.nursing.service.impl;

import java.util.List;

import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zzyl.common.constant.HttpStatus;
import com.zzyl.common.core.page.TableDataInfo;
import com.zzyl.common.utils.DateUtils;
import com.zzyl.nursing.domain.dto.ElderQueryDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zzyl.nursing.mapper.ElderMapper;
import com.zzyl.nursing.domain.Elder;
import com.zzyl.nursing.service.IElderService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import java.util.Arrays;

/**
 * 老人Service业务层处理
 *
 * @author ruoyi
 * @date 2025-02-18
 */
@Service
public class ElderServiceImpl extends ServiceImpl<ElderMapper, Elder> implements IElderService {
    @Autowired
    private ElderMapper elderMapper;

    /**
     * 查询老人
     *
     * @param id 老人主键
     * @return 老人
     */
    @Override
    public Elder selectElderById(Long id) {
        return getById(id);
    }

    /**
     * 查询老人列表
     *
     * @param elder 老人
     * @return 老人
     */
    @Override
    public List<Elder> selectElderList(Elder elder) {
        return elderMapper.selectElderList(elder);
    }

    /**
     * 新增老人
     *
     * @param elder 老人
     * @return 结果
     */
    @Override
    public int insertElder(Elder elder) {
        return save(elder) ? 1 : 0;
    }

    /**
     * 修改老人
     *
     * @param elder 老人
     * @return 结果
     */
    @Override
    public int updateElder(Elder elder) {
        return updateById(elder) ? 1 : 0;
    }

    /**
     * 批量删除老人
     *
     * @param ids 需要删除的老人主键
     * @return 结果
     */
    @Override
    public int deleteElderByIds(Long[] ids) {
        return removeByIds(Arrays.asList(ids)) ? 1 : 0;
    }

    /**
     * 删除老人信息
     *
     * @param id 老人主键
     * @return 结果
     */
    @Override
    public int deleteElderById(Long id) {
        return removeById(id) ? 1 : 0;
    }

    /**
     * 老人分页查询
     *
     * @param elderQueryDTO
     * @return
     */
    @Override
    public TableDataInfo pageQuery(ElderQueryDTO elderQueryDTO) {
        // 分页查询老人数据
        // 创建条件构建器
        LambdaQueryWrapper<Elder> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper
                .select(Elder::getId, Elder::getName, Elder::getIdCardNo, Elder::getBedNumber)
                .eq(ObjectUtil.isNotEmpty(elderQueryDTO.getStatus()), Elder::getStatus, elderQueryDTO.getStatus())
                .like(ObjectUtil.isNotEmpty(elderQueryDTO.getName()), Elder::getName, elderQueryDTO.getName())
                .eq(ObjectUtil.isNotEmpty(elderQueryDTO.getIdCardNo()), Elder::getIdCardNo, elderQueryDTO.getIdCardNo());


        // 创建分页对象
        Page<Elder> page = new Page<>(elderQueryDTO.getPageNum(), elderQueryDTO.getPageSize());
        page = page(page, lambdaQueryWrapper);

        // 返回分页结果
        return getDataTable(page);
    }

    /**
     * 封装分页结果
     *
     * @param page
     * @return
     */
    private TableDataInfo getDataTable(Page<Elder> page) {
        // 封装分页结果
        TableDataInfo tableDataInfo = new TableDataInfo();
        tableDataInfo.setTotal(page.getTotal());
        tableDataInfo.setCode(HttpStatus.SUCCESS);
        tableDataInfo.setMsg("请求成功");
        tableDataInfo.setRows(page.getRecords());
        return tableDataInfo;
    }
}
