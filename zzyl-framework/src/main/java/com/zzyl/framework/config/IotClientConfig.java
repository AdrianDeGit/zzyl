package com.zzyl.framework.config;


import com.huaweicloud.sdk.core.auth.BasicCredentials;
import com.huaweicloud.sdk.core.auth.ICredential;
import com.huaweicloud.sdk.core.region.Region;
import com.huaweicloud.sdk.iotda.v5.IoTDAClient;
import com.zzyl.framework.config.properties.HuaWeiIotConfigProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.annotation.Resource;

/**
 * @Date: 2025/7/22 20:10
 * @Author: Adrian
 * @Version: 1.0
 * @Description:
 */
@Configuration
public class IotClientConfig {

    @Resource
    private HuaWeiIotConfigProperties huaWeiIotConfigProperties;

    /**
     * 创建华为IoT平台客户端实例
     * 该方法根据配置文件中的参数初始化IoTDAClient，并将其注册为Spring Bean
     *
     * @return IoTDAClient 华为IoT平台客户端实例
     */
    @Bean
    public IoTDAClient huaWeiIotInstance() {
        // 配置认证信息
        ICredential auth = new BasicCredentials()
                .withAk(huaWeiIotConfigProperties.getAk())           // 配置Access Key
                .withSk(huaWeiIotConfigProperties.getSk())           // 配置Secret Key
                // 标准版/企业版需要使用衍生算法，基础版请删除配置"withDerivedPredicate"
                .withDerivedPredicate(BasicCredentials.DEFAULT_DERIVED_PREDICATE)
                .withProjectId(huaWeiIotConfigProperties.getProjectId()); // 配置项目ID

        // 构建IoT客户端实例
        return IoTDAClient.newBuilder()
                .withCredential(auth)                                 // 设置认证信息
                // 标准版/企业版：需自行创建Region对象，基础版：请使用IoTDARegion的region对象，如"withRegion(IoTDARegion.CN_NORTH_4)"
                .withRegion(new Region(huaWeiIotConfigProperties.getRegionId(), huaWeiIotConfigProperties.getEndpoint()))
                // .withRegion(IoTDARegion.CN_NORTH_4)
                .build();
    }
}
