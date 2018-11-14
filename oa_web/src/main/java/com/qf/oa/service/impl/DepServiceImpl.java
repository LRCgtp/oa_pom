package com.qf.oa.service.impl;

import com.qf.oa.dao.DepartmentMapper;
import com.qf.oa.entity.Department;
import com.qf.oa.service.IDepService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author ken
 * @Time 2018/11/1 10:19
 * @Version 1.0
 */
@Service
public class DepServiceImpl implements IDepService {

    @Autowired
   DepartmentMapper departmentMapper;


    @Override
    public List<Department> queryAll() {
        return departmentMapper.getDepartmentList();
    }
}
