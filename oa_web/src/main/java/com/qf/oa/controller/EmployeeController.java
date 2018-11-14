package com.qf.oa.controller;

import com.qf.oa.entity.Employee;
import com.qf.oa.service.EmployeeService;
import com.qf.ssm.controller.BaseController;
import com.qf.ssm.interceptor.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/employeeController")
public class EmployeeController extends BaseController {

    @Autowired
   private  EmployeeService employeeService;

    @RequestMapping("/list")
    public  String getEmployeePage(Model model, Page page){
        List<Employee> list = employeeService.getEmployeeList();
        model.addAttribute("list",list);
        return "empList";
    }

    @RequestMapping("/listajax")
    @ResponseBody
    public  List<Employee> getEmployeeList(){
        List<Employee> list = employeeService.getEmployeeList();
        return list;
    }
}
