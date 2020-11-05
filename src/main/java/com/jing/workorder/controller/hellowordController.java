package com.jing.workorder.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/api")
@Api(tags = "用户管理")
public class hellowordController {

    @RequestMapping(value = "helloword", method = {RequestMethod.GET})
    @ApiOperation("接口测试")
    public String helloword () {
        return "this is workorder hello word!";
    }
}
