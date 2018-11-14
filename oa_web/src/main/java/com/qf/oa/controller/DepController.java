package com.qf.oa.controller;

import com.qf.oa.entity.Department;
import com.qf.oa.service.IDepService;
import com.qf.ssm.controller.BaseController;
import com.qf.ssm.interceptor.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @Author ken
 * @Time 2018/11/1 10:13
 * @Version 1.0
 */
@Controller
@RequestMapping("/dep")
public class DepController extends BaseController {

    @Autowired
    private IDepService depService;
    
    @RequestMapping("/list")
    public String depList(Model model, Page page){
        List<Department> deps = depService.queryAll();
        model.addAttribute("deps", deps);
        return "deplist";
    }
}
