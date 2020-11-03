package com.jing.workorder.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.jing.workorder.entity.User;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author jingtian.wang
 * @since 2020-11-03
 */
public interface IUserService extends IService<User> {

    Object findList(IPage<User>page);

}
