package com.yzh.workorder.controller;

import com.yzh.workorder.entity.ResponseBody;
import com.yzh.workorder.utils.JwtUtils;
import io.swagger.annotations.Api;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

/**
 * @description: LoginController
 * @author: jingtian.wang
 * @time: 2020/11/19 19:46
 */

@RestController
@Api(tags = "登录管理")
public class LoginController {
    @PostMapping(value = "/login")
    public ResponseBody userLogin(@RequestParam(name = "phoneNo", required = true) String phoneNo,
                            @RequestParam(name = "password", required = true) String password, ServletResponse response) {

        // 获取当前用户主体
        Subject subject = SecurityUtils.getSubject();
        String msg = null;
        boolean loginSuccess = false;
        // 将用户名和密码封装成 UsernamePasswordToken 对象
        UsernamePasswordToken token = new UsernamePasswordToken(phoneNo, password);
        try {
            subject.login(token);
            msg = "登录成功。";
            loginSuccess = true;
        } catch (UnknownAccountException uae) { // 账号不存在
            msg = "用户名与密码不匹配，请检查后重新输入！";
        } catch (LockedAccountException lae) { // 账号已被锁定
            msg = "该账户已被锁定，如需解锁请联系管理员！";
        } catch (AuthenticationException ae) { // 其他身份验证异常
            msg = "登录异常，请联系管理员！";
        }

        if (loginSuccess) {
            // 若登录成功，签发 JWT token
            String jwtToken = JwtUtils.sign(phoneNo, JwtUtils.SECRET);
            // 将签发的 JWT token 设置到 HttpServletResponse 的 Header 中
            ((HttpServletResponse) response).setHeader(JwtUtils.AUTH_HEADER, jwtToken);

            return ResponseBody.builder().code(200).message(msg).data(jwtToken).build();

        } else {
            return ResponseBody.builder().code(401).message(msg).data("").build();
        }

    }

    @GetMapping("/logout")
    public ResponseBody logout() {
        return ResponseBody.builder().code(200).message("退出登录").build();

    }
}
