package com.zzyl.nursing.service.impl;

import java.time.LocalDateTime;
import java.util.List;

import cn.hutool.core.util.IdcardUtil;
import com.alibaba.fastjson2.JSON;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.zzyl.common.exception.base.BaseException;
import com.zzyl.common.utils.ContractNumberGenerator;
import com.zzyl.common.utils.bean.BeanUtils;
import com.zzyl.nursing.domain.*;
import com.zzyl.nursing.dto.CheckInApplyDTO;
import com.zzyl.nursing.dto.CheckInElderDTO;
import com.zzyl.nursing.mapper.*;
import com.zzyl.nursing.vo.CheckInConfigVO;
import com.zzyl.nursing.vo.CheckInDetailVO;
import com.zzyl.nursing.vo.CheckInElderVO;
import com.zzyl.nursing.vo.ElderFamilyVO;
import org.apache.commons.lang3.ObjectUtils;
import org.springframework.stereotype.Service;
import com.zzyl.nursing.service.ICheckInService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Arrays;

/**
 * 入住Service业务层处理
 *
 * @author ruoyi
 * @date 2025-02-18
 */
@Service
public class CheckInServiceImpl extends ServiceImpl<CheckInMapper, CheckIn> implements ICheckInService {
    @Resource
    private CheckInMapper checkInMapper;

    @Resource
    private ElderMapper elderMapper;

    @Resource
    private BedMapper bedMapper;

    @Resource
    private CheckInConfigMapper checkInConfigMapper;

    @Resource
    private ContractMapper contractMapper;


    /**
     * 查询入住
     *
     * @param id 入住主键
     * @return 入住
     */
    @Override
    public CheckIn selectCheckInById(Long id) {
        return getById(id);
    }

    /**
     * 查询入住列表
     *
     * @param checkIn 入住
     * @return 入住
     */
    @Override
    public List<CheckIn> selectCheckInList(CheckIn checkIn) {
        return checkInMapper.selectCheckInList(checkIn);
    }

    /**
     * 新增入住
     *
     * @param checkIn 入住
     * @return 结果
     */
    @Override
    public int insertCheckIn(CheckIn checkIn) {
        return save(checkIn) ? 1 : 0;
    }

    /**
     * 修改入住
     *
     * @param checkIn 入住
     * @return 结果
     */
    @Override
    public int updateCheckIn(CheckIn checkIn) {
        return updateById(checkIn) ? 1 : 0;
    }

    /**
     * 批量删除入住
     *
     * @param ids 需要删除的入住主键
     * @return 结果
     */
    @Override
    public int deleteCheckInByIds(Long[] ids) {
        return removeByIds(Arrays.asList(ids)) ? 1 : 0;
    }

    /**
     * 删除入住信息
     *
     * @param id 入住主键
     * @return 结果
     */
    @Override
    public int deleteCheckInById(Long id) {
        return removeById(id) ? 1 : 0;
    }

    /**
     * 申请入住
     *
     * @param checkInApplyDTO
     */
    @Override
    @Transactional
    public void apply(CheckInApplyDTO checkInApplyDTO) {
        // 判断老人是否已经入住
        // 通过身份证号查询老人
        LambdaQueryWrapper<Elder> elderQueryWrapper = new LambdaQueryWrapper<Elder>();
        elderQueryWrapper.eq(Elder::getIdCardNo, checkInApplyDTO.getCheckInElderDTO().getIdCardNo());
        elderQueryWrapper.in(Elder::getStatus,0,1,2,3,4);
        Elder elder =  elderMapper.selectOne(elderQueryWrapper);
        if(ObjectUtils.isNotEmpty(elder)) {
            throw new BaseException("老人已入住");
        }

        // 更新床位的状态  已入住
        Bed bed = bedMapper.selectById(checkInApplyDTO.getCheckInConfigDTO().getBedId());
        bed.setBedStatus(1);
        bedMapper.updateById(bed);

        // 保存或更新老人数据
        elder = insertOrUpdate(bed, checkInApplyDTO.getCheckInElderDTO());

        // 生成合同编号
        String contractNo = "HT" + ContractNumberGenerator.generateContractNumber();

        // 新增签约办理
        insertContract(contractNo, elder, checkInApplyDTO);

        // 新增入住信息
        CheckIn checkIn = insertCheckIn(elder, checkInApplyDTO);

        // 新增入住配置信息
        insertCheckInConfig(checkIn.getId(), checkInApplyDTO);
    }

    /**
     * 新增入住配置
     * @param checkInApplyDTO
     */
    private void insertCheckInConfig(Long checkInId, CheckInApplyDTO checkInApplyDTO) {
        CheckInConfig checkInConfig = new CheckInConfig();
        BeanUtils.copyProperties(checkInApplyDTO.getCheckInConfigDTO(), checkInConfig);
        checkInConfig.setCheckInId(checkInId);
        checkInConfigMapper.insert(checkInConfig);
    }

    /**
     * 新增入住信息
     * @param elder
     * @param checkInApplyDTO
     */
    private CheckIn insertCheckIn(Elder elder, CheckInApplyDTO checkInApplyDTO) {
        CheckIn checkIn = new CheckIn();
        checkIn.setElderId(elder.getId());
        checkIn.setElderName(elder.getName());
        checkIn.setIdCardNo(elder.getIdCardNo());
        checkIn.setNursingLevelName(checkInApplyDTO.getCheckInConfigDTO().getNursingLevelName());
        checkIn.setStartDate(checkInApplyDTO.getCheckInConfigDTO().getStartDate());
        checkIn.setEndDate(checkInApplyDTO.getCheckInConfigDTO().getEndDate());
        checkIn.setBedNumber(elder.getBedNumber());
        checkIn.setRemark(JSON.toJSONString(checkInApplyDTO.getElderFamilyDTOList()));
        checkIn.setStatus(0);
        checkInMapper.insert(checkIn);
        return checkIn;
    }

    /**
     * 新增合同
     * @param contractNo
     * @param elder
     * @param checkInApplyDTO
     */
    private void insertContract(String contractNo, Elder elder, CheckInApplyDTO checkInApplyDTO) {

        Contract contract = new Contract();
        // 属性拷贝
        BeanUtils.copyProperties(checkInApplyDTO.getCheckInContractDTO(), contract);
        contract.setContractNumber(contractNo);
        contract.setElderId(elder.getId());
        contract.setElderName(elder.getName());
        // 状态、开始时间、结束时间
        LocalDateTime checkInStartTime = checkInApplyDTO.getCheckInConfigDTO().getStartDate();
        LocalDateTime checkInEndTime = checkInApplyDTO.getCheckInConfigDTO().getEndDate();
        // 签约时间小于等于当前时间，合同生效中
        Integer status = checkInStartTime.isBefore(LocalDateTime.now()) ? 0 : 1;
        contract.setStatus(status);
        contract.setStartDate(checkInStartTime);
        contract.setEndDate(checkInEndTime);
        contractMapper.insert(contract);
    }

    /**
     * 新增或更新老人
     * @param bed
     * @param checkInElderDTO
     * @return
     */
    private Elder insertOrUpdate(Bed bed, CheckInElderDTO checkInElderDTO) {

        // 准备老人数据
        Elder elder = new Elder();
        // 属性拷贝
        BeanUtils.copyProperties(checkInElderDTO, elder);
        elder.setBedNumber(bed.getBedNumber());
        elder.setBedId(bed.getId());
        elder.setStatus(1);
        // 查询老人信息，（身份证号、状态不为1）
        LambdaQueryWrapper<Elder> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(Elder::getIdCardNo, checkInElderDTO.getIdCardNo())
                .eq(Elder::getStatus, 5);//查询已退住的老人（曾经入住过）
        Elder elderDb =  elderMapper.selectOne(lambdaQueryWrapper);
        if(ObjectUtils.isNotEmpty(elderDb)) {
            elder.setId(elderDb.getId());//将已有老人id封装给elder对象
            // 修改
            elderMapper.updateById(elder);
        }else {
            // 新增
            elderMapper.insert(elder);
        }
        return elder;
    }

    @Override
    public CheckInDetailVO detail(Long id) {
        // 准备结果对象
        CheckInDetailVO checkInDetailVO = new CheckInDetailVO();
        // 1.设置入住配置响应信息
        CheckInConfigVO checkInConfigVO = new CheckInConfigVO();
        CheckIn checkIn = checkInMapper.selectById(id);
        BeanUtils.copyProperties(checkIn, checkInConfigVO);

        CheckInConfig checkInConfig = checkInConfigMapper.selectOne(new LambdaQueryWrapper<CheckInConfig>().eq(CheckInConfig::getCheckInId, id));
        BeanUtils.copyProperties(checkInConfig, checkInConfigVO);

        checkInDetailVO.setCheckInConfigVO(checkInConfigVO);

        // 2.设置老人响应信息
        CheckInElderVO checkInElderVO = new CheckInElderVO();
        // 获取老人ID
        Long elderId = checkIn.getElderId();
        Elder elder = elderMapper.selectById(elderId);
        BeanUtils.copyProperties(elder, checkInElderVO);
        // 从身份证号中获取老人的年龄
        checkInElderVO.setAge(IdcardUtil.getAgeByIdCard(elder.getIdCardNo()));
        checkInDetailVO.setCheckInElderVO(checkInElderVO);

        // 3.设置家属响应信息
        String remark = checkIn.getRemark();
        List<ElderFamilyVO> elderFamilyVOs = JSON.parseArray(remark, ElderFamilyVO.class);
        checkInDetailVO.setElderFamilyVOList(elderFamilyVOs);

        // 4.设置签约办理响应信息
        Contract contract = contractMapper.selectOne(new LambdaQueryWrapper<Contract>().eq(Contract::getElderId, elderId));
        checkInDetailVO.setContract(contract);

        // 5.返回结果
        return checkInDetailVO;
    }
}
