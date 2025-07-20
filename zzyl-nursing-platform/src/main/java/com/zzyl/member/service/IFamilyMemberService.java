package com.zzyl.member.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.zzyl.member.domain.FamilyMember;
import com.zzyl.member.domain.dto.UserLoginRequestDTO;
import com.zzyl.member.domain.vo.LoginVO;

/**
 * @Date: 2025/7/19 21:34
 * @Author: Adrian
 * @Version: 1.0
 * @Description:
 */
public interface  IFamilyMemberService extends IService<FamilyMember> {
    LoginVO login(UserLoginRequestDTO userLoginRequestDTO);
}
