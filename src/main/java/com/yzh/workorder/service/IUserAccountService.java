package com.yzh.workorder.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.yzh.workorder.entity.UserAccount;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 系统用户账号表 服务类
 * </p>
 *
 * @author jingtian.wang
 * @since 2020-11-19
 */
public interface IUserAccountService extends IService<UserAccount> {
    Object findList(IPage<UserAccount> page);

    Object findUserByPhoneNo(String phoneNo);
}
