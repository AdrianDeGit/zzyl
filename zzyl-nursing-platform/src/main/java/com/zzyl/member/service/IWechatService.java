package com.zzyl.member.service;


/**
 * @Date: 2025/7/19 21:42
 * @Author: Adrian
 * @Version: 1.0
 * @Description:
 */
public interface IWechatService {
    /**
     * 获取openid
     * @param code
     * @return
     */
    public String getOpenid(String code);

    /**
     * 获取手机号
     * @param detailCode
     * @return
     */
    public String getPhone(String detailCode);
}
