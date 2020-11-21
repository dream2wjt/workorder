package com.yzh.workorder.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.yzh.workorder.entity.UserAccount;
import com.yzh.workorder.mapper.UserAccountMapper;
import com.yzh.workorder.service.IUserAccountService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 系统用户账号表 服务实现类
 * </p>
 *
 * @author jingtian.wang
 * @since 2020-11-19
 */
@Service
public class UserAccountServiceImpl extends ServiceImpl<UserAccountMapper, UserAccount> implements IUserAccountService {
    @Override
    public Object findList(IPage<UserAccount> page) {
        QueryWrapper<UserAccount> wrapper = new QueryWrapper<>();
        IPage<UserAccount> userIPage = baseMapper.selectPage(page, wrapper);
        return userIPage;
    }

    @Override
    public Object findUser(String phoneNo) {
        QueryWrapper<UserAccount> wrapper = new QueryWrapper<>();
        wrapper.select("phoneNo").equals(phoneNo);
        UserAccount user = baseMapper.selectOne(wrapper);
        return user;
    }
}
