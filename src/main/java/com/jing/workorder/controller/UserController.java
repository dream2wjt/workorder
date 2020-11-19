package com.jing.workorder.controller;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.jing.workorder.entity.User;
import com.jing.workorder.service.IUserService;
import com.jing.workorder.entity.ResponseBody;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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
@Api(tags = "用户管理")
public class UserController {

    @Autowired
    IUserService userService;

    @ApiOperation("分页查询")
    @PostMapping(value = "/findAll")
    public Object findAll(
            @ApiParam("查看第几页") @RequestParam int pageIndex,
            @ApiParam("每页多少条") @RequestParam int pageSize) {
        //获取前台发送过来的数据
        IPage<User> page = new Page<>(pageIndex, pageSize);
        return ResponseBody.builder().code(200).message("操作成功").data(userService.findList(page)).build();
    }

}
