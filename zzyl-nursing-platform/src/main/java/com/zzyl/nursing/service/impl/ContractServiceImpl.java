package com.zzyl.nursing.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zzyl.nursing.domain.Contract;
import com.zzyl.nursing.mapper.ContractMapper;
import com.zzyl.nursing.service.IContractService;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;

/**
 * 合同Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-02-18
 */
@Service
public class ContractServiceImpl extends ServiceImpl<ContractMapper, Contract> implements IContractService
{
    @Autowired
    private ContractMapper contractMapper;

    /**
     * 查询合同
     * 
     * @param id 合同主键
     * @return 合同
     */
    @Override
    public Contract selectContractById(Long id)
    {
        return getById(id);
    }

    /**
     * 查询合同列表
     * 
     * @param contract 合同
     * @return 合同
     */
    @Override
    public List<Contract> selectContractList(Contract contract)
    {
        return contractMapper.selectContractList(contract);
    }

    /**
     * 新增合同
     * 
     * @param contract 合同
     * @return 结果
     */
    @Override
    public int insertContract(Contract contract)
    {
        return save(contract) ? 1 : 0;
    }

    /**
     * 修改合同
     * 
     * @param contract 合同
     * @return 结果
     */
    @Override
    public int updateContract(Contract contract)
    {
        return updateById(contract) ? 1 : 0;
    }

    /**
     * 批量删除合同
     * 
     * @param ids 需要删除的合同主键
     * @return 结果
     */
    @Override
    public int deleteContractByIds(Long[] ids)
    {
        return removeByIds(Arrays.asList(ids)) ? 1 : 0;
    }

    /**
     * 删除合同信息
     * 
     * @param id 合同主键
     * @return 结果
     */
    @Override
    public int deleteContractById(Long id)
    {
        return removeById(id) ? 1 : 0;
    }


    /**
     * 更新合同状态
     */
    @Override
    public void updateContractStatus() {
        //1.查询状态=0的以及签约时间大于当前时间的合同，全部更新为1
        LambdaQueryWrapper<Contract> queryWrapper= Wrappers.lambdaQuery();
        queryWrapper.eq(Contract::getStatus,0);
        queryWrapper.le(Contract::getSignDate, LocalDateTime.now());
        List<Contract> contractList = list(queryWrapper);
        if (CollectionUtils.isEmpty(contractList)) {
            return;
        }
        //3.更新状态值1
        contractList.forEach(contract -> {
            contract.setStatus(1);
        });
        //2.批量更新
        updateBatchById(contractList);
    }
}
