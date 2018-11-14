package com.qf.oa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Author ken
 * @Time 2018/11/1 9:48
 * @Version 1.0
 */
@Controller
public class LoginController {

    @RequestMapping("/login")
    public String login(String username, String password){
        return "index";
    }

    /**
     * 通用的页面跳转
     * @return
     */
    @RequestMapping("/topage/{page}")
    public String toPage(@PathVariable String page){
        return page;
    }

}
