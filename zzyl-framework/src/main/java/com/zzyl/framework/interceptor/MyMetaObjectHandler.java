package com.zzyl.framework.interceptor;


import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import com.zzyl.common.core.domain.model.LoginUser;
import com.zzyl.common.utils.SecurityUtils;
import lombok.SneakyThrows;
import org.apache.commons.lang3.ObjectUtils;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * @Date: 2025/7/11 9:55
 * @Author: Adrian
 * @Version: 1.0
 * @Description:
 */
@Component
public class MyMetaObjectHandler implements MetaObjectHandler {

    @Autowired
    private HttpServletRequest request;

    @SneakyThrows
    public boolean isExclude() {
        String requestURI = request.getRequestURI();
        if (requestURI.startsWith("/member")) {
            return true;
        }
        return false;
    }

    @Override
    public void insertFill(MetaObject metaObject) {
        this.strictInsertFill(metaObject, "createTime", Date.class, new Date());
        this.strictInsertFill(metaObject, "createBy", String.class, String.valueOf(loadUserId()));
        if (!isExclude()) {
            this.strictInsertFill(metaObject, "createBy", String.class, loadUserId() + "");
        }
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        this.setFieldValByName("updateTime", new Date(), metaObject);
        this.setFieldValByName("updateBy", String.valueOf(loadUserId()), metaObject);
        // this.strictUpdateFill(metaObject, "updateTime", Date.class, new Date());
        // this.strictUpdateFill(metaObject, "updateBy", String.class, String.valueOf(getLoginUser()));
        if (!isExclude()) {
            this.setFieldValByName("updateBy", loadUserId() + "", metaObject);
        }

    }

    /**
     * 获取当前登录人的ID
     *
     * @return 登录人ID
     */
    public Long loadUserId() {
        // LoginUser loginUser = SecurityUtils.getLoginUser();
        // if (loginUser != null) {
        //     return loginUser.getUserId();
        // }
        // return 1L;
        // 获取当前登录人的id
        try {
            LoginUser loginUser = SecurityUtils.getLoginUser();
            if (ObjectUtils.isNotEmpty(loginUser)) {
                return loginUser.getUserId();
            }
            return 1L;
        } catch (Exception e) {
            return 1L;
        }
    }
}
