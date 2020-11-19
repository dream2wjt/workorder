package com.jing.workorder.controller;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.jing.workorder.entity.ResponseBody;
import com.jing.workorder.entity.UserAccount;
import com.jing.workorder.service.IUserAccountService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 系统用户账号表 前端控制器
 * </p>
 *
 * @author jingtian.wang
 * @since 2020-11-19
 */
@RestController
@RequestMapping("/user-account")
@Api(tags = "用户管理")
public class UserAccountController {
    @Autowired
    IUserAccountService userAccountService;

    @ApiOperation("分页查询")
    @PostMapping(value = "/findAll")
    public Object findAll(
            @ApiParam("查看第几页") @RequestParam int pageIndex,
            @ApiParam("每页多少条") @RequestParam int pageSize) {
        //获取前台发送过来的数据
        IPage<UserAccount> page = new Page<>(pageIndex, pageSize);
        return ResponseBody.builder().code(200).message("操作成功").data(userAccountService.findList(page)).build();
    }
}
