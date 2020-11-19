package com.jing.workorder.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.jing.workorder.entity.UserAccount;
import com.jing.workorder.mapper.UserAccountMapper;
import com.jing.workorder.service.IUserAccountService;
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
}
