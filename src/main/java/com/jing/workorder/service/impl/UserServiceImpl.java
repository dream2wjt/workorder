package com.jing.workorder.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.jing.workorder.entity.User;
import com.jing.workorder.mapper.UserMapper;
import com.jing.workorder.service.IUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author jingtian.wang
 * @since 2020-11-03
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {

    @Override
    public Object findList(IPage<User> page) {
        QueryWrapper<User> wrapper = new QueryWrapper<>();
        IPage<User> userIPage = baseMapper.selectPage(page, wrapper);
        return userIPage;
    }
}
