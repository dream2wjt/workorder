package com.jing.workorder.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/api")
public class hellowordController {

    @RequestMapping(value = "helloword", method = {RequestMethod.GET})
    public String helloword () {
        return "this is workorder hello word!";
    }
}
