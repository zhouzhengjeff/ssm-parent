package com.hnguigu.ssm.service.impl;

import com.hnguigu.ssm.entity.Department;
import com.hnguigu.ssm.mapper.DepartmentMapper;
import com.hnguigu.ssm.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ObjectUtils;

@Service("departmentService")
@Transactional
public class DepartmentServiceImpl implements DepartmentService {

    @Autowired
    private DepartmentMapper departmentMapper;

    @Override
    public void addDepartment(Department department) {
        if (ObjectUtils.isEmpty(department)) {
            throw new IllegalArgumentException("");
        }

        this.departmentMapper.save(department);
    }
}
