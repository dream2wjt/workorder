package com.jing.workorder.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping(value = "/api")
@Api(tags = "欢迎页面")
public class hellowordController {

    @RequestMapping(value = "helloword", method = {RequestMethod.GET})
    @ApiOperation("接口测试")
    public String helloword () {
        log.info("hello word");
        return "this is workorder hello word!";
    }
}
