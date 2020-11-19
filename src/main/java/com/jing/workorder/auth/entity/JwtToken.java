package com.jing.workorder.auth.entity;

import com.jing.workorder.utils.JwtUtils;
import org.apache.shiro.authc.AuthenticationToken;

/**
 * @description: JwtToken
 * @author: jingtian.wang
 * @time: 2020/11/19 15:59
 */

public class JwtToken implements AuthenticationToken {

    private static final long serialVersionUID = 1L;

    // 加密后的 JWT token串
    private String token;

    private String userName;

    public JwtToken(String token) {
        this.token = token;
        this.userName = JwtUtils.getClaimFiled(token, "username");
    }

    @Override
    public Object getPrincipal() {
        return this.userName;
    }

    @Override
    public Object getCredentials() {
        return token;
    }
}
