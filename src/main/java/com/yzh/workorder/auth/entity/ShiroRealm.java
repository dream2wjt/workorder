package com.yzh.workorder.auth.entity;

import com.yzh.workorder.entity.UserAccount;
import com.yzh.workorder.service.IUserAccountService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

/**
 * @description: ShiroRealm
 * @author: jingtian.wang
 * @time: 2020/11/19 16:43
 */

/**
 * 同时开启身份验证和权限验证，需要继承 AuthorizingRealm
 * 并实现其  doGetAuthenticationInfo()和 doGetAuthorizationInfo 两个方法
 */
@SuppressWarnings("serial")
public class ShiroRealm extends AuthorizingRealm {

    @Autowired
    IUserAccountService userAccountService;

    public static Map<String, UserAccount> userMap = new HashMap<String, UserAccount>(16);
    public static Map<String, Set<String>> roleMap = new HashMap<String, Set<String>>(16);
    public static Map<String, Set<String>> permMap = new HashMap<String, Set<String>>(16);


    static {
        UserAccount user1 = new UserAccount();
        UserAccount user2 = new UserAccount();

        userMap.put("graython", user1);
        userMap.put("plum", user2);

        roleMap.put("graython", new HashSet<String>() {
            {
                add("admin");

            }
        });

        roleMap.put("plum", new HashSet<String>() {
            {
                add("guest");
            }
        });
        permMap.put("plum", new HashSet<String>() {
            {
                add("article:read");
            }
        });
    }
    /**
     * 限定这个 Realm 只处理 UsernamePasswordToken
     */
    @Override
    public boolean supports(AuthenticationToken token) {
        return token instanceof UsernamePasswordToken;
    }
    /**
     * 查询数据库，将获取到的用户安全数据封装返回
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        // 从 AuthenticationToken 中获取当前用户
        String phoneNo = (String) token.getPrincipal();
        // 查询数据库获取用户信息，此处使用 Map 来模拟数据库
//        UserAccount user = userMap.get(username);
        UserAccount user = (UserAccount)userAccountService.findUser(phoneNo);

        // 用户不存在
        if (user == null) {
            throw new UnknownAccountException("用户不存在！");
        }

        // 用户被锁定
        if (user.getLocked()) {
            throw new LockedAccountException("该用户已被锁定,暂时无法登录！");
        }

        // 使用用户名作为盐值
        ByteSource credentialsSalt = ByteSource.Util.bytes(phoneNo);

        /**
         * 将获取到的用户数据封装成 AuthenticationInfo 对象返回，此处封装为 SimpleAuthenticationInfo 对象。
         *  参数1. 认证的实体信息，可以是从数据库中获取到的用户实体类对象或者用户名
         *  参数2. 查询获取到的登录密码
         *  参数3. 盐值
         *  参数4. 当前 Realm 对象的名称，直接调用父类的 getName() 方法即可
         */
        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(user, user.getPassword(), credentialsSalt,
                getName());
        return info;
    }

    /**
     * 查询数据库，将获取到的用户的角色及权限信息返回
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        // 获取当前用户
        UserAccount currentUser = (UserAccount) SecurityUtils.getSubject().getPrincipal();
        // UserEntity currentUser = (UserEntity)principals.getPrimaryPrincipal();
        // 查询数据库，获取用户的角色信息
        Set<String> roles = roleMap.get(currentUser.getName());
        // 查询数据库，获取用户的权限信息
        Set<String> perms = permMap.get(currentUser.getName());

        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        info.setRoles(roles);
        info.setStringPermissions(perms);
        return info;
    }
}
