package com.zzyl.web;

import com.zzyl.member.service.IWechatService;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;

@SpringBootTest
public class WechatServiceImplTest {

    @Resource
    private IWechatService wechatService;

    @Test
    public void testGetOpenid() {
        String openid = wechatService.getOpenid("wx57327926b9aa8672");
        System.out.println(openid);
    }

    @Test
    public void testGetPhone() {
        String phone = wechatService.getPhone("4e22277e0fc763c2fd9ab764f9f10330");
        System.out.println(phone);
    }
}