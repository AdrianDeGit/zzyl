package com.zzyl.member.controller;

import com.zzyl.common.core.domain.AjaxResult;
import com.zzyl.member.domain.dto.UserLoginRequestDTO;
import com.zzyl.member.domain.vo.LoginVO;
import com.zzyl.member.service.IFamilyMemberService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import static com.zzyl.common.core.domain.AjaxResult.success;

/**
 * @Date: 2025/7/19 21:33
 * @Author: Adrian
 * @Version: 1.0
 * @Description:
 */
@RestController
@RequestMapping("/member/user")
@Api(tags = "老人家属相关接口")
public class FamilyMemberController {
    @Autowired
    private IFamilyMemberService familyMemberService;

    @PostMapping("/login")
    @ApiOperation("小程序登录")
    public AjaxResult login(@RequestBody UserLoginRequestDTO userLoginRequestDTO) {
        LoginVO loginVO = familyMemberService.login(userLoginRequestDTO);
        return success(loginVO);
    }
}
