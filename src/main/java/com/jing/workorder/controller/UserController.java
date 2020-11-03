package com.jing.workorder.controller;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.jing.workorder.entity.User;
import com.jing.workorder.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author jingtian.wang
 * @since 2020-11-03
 */
@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    IUserService userService;

    @RequestMapping(value = "/findAll", method = {RequestMethod.POST})
    public Object findAll(HttpServletRequest request) {
        //获取前台发送过来的数据
        Integer pageNo = Integer.valueOf(request.getParameter("pageNo"));
        Integer pageSize = Integer.valueOf(request.getParameter("pageSize"));
        IPage<User> page = new Page<>(pageNo, pageSize);
        return  userService.findList(page);
    }

}
