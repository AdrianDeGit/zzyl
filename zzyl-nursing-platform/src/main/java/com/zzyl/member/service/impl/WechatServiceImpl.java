package com.zzyl.member.service.impl;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.http.HttpUtil;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import com.zzyl.member.service.IWechatService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class WechatServiceImpl implements IWechatService {


    // 登录
    private static final String REQUEST_URL = "https://api.weixin.qq.com/sns/jscode2session?grant_type=authorization_code";

    // 获取token
    private static final String TOKEN_URL = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential";

    // 获取手机号
    private static final String PHONE_REQUEST_URL = "https://api.weixin.qq.com/wxa/business/getuserphonenumber?access_token=";


    @Value("${wechat.appId}")
    private String appid;

    @Value("${wechat.appSecret}")
    private String secret;


    /**
     * 获取openid
     * @param code
     * @return
     */
    @Override
    public String getOpenid(String code) {

        // 获取公共参数
        Map<String,Object> paramMap = getAppConfig();
        paramMap.put("js_code", code);

        String result = HttpUtil.get(REQUEST_URL, paramMap);
        // 结果是一个map
        JSONObject jsonObject = JSONUtil.parseObj(result);
        // 判断接口响应是否出错
        if(ObjectUtil.isNotEmpty(jsonObject.getInt("errcode"))) {
            throw new RuntimeException(jsonObject.getStr("errmsg"));
        }

        return jsonObject.getStr("openid");
    }

    /**
     * 获取手机号
     * @param detailCode
     * @return
     */
    @Override
    public String getPhone(String detailCode) {
        String token = getToken();
        String url = PHONE_REQUEST_URL + token;
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("code", detailCode);
        // 发起请求
        String result = HttpUtil.post(url, JSONUtil.toJsonStr(paramMap));
        // 是一个map
        JSONObject jsonObject = JSONUtil.parseObj(result);
        // 判断接口响应是否出错
        if(jsonObject.getInt("errcode") != 0) {
            throw new RuntimeException(jsonObject.getStr("errmsg"));
        }
        return jsonObject.getJSONObject("phone_info").getStr("phoneNumber");
    }

    /**
     * 封装公共参数
     * @return
     */
    private Map<String, Object> getAppConfig() {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("appid", appid);
        paramMap.put("secret", secret);
        return paramMap;
    }

    /**
     * 获取token
     * @return
     */
    private String getToken() {
        Map<String, Object> paramMap = getAppConfig();
        // 发起请求
        String result = HttpUtil.get(TOKEN_URL, paramMap);
        // 是一个map
        JSONObject jsonObject = JSONUtil.parseObj(result);
        // 判断接口响应是否出错
        if(ObjectUtil.isNotEmpty(jsonObject.getInt("errcode"))) {
            throw new RuntimeException(jsonObject.getStr("errmsg"));
        }
        return jsonObject.getStr("access_token");

    }
}