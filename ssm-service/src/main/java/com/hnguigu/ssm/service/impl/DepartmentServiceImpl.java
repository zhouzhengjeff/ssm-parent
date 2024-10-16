package com.hnguigu.ssm.service.impl;

import com.hnguigu.ssm.entity.Department;
import com.hnguigu.ssm.entity.User;
import com.hnguigu.ssm.exception.SsmException;
import com.hnguigu.ssm.mapper.DepartmentMapper;
import com.hnguigu.ssm.service.DepartmentService;
import com.hnguigu.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import org.springframework.util.ObjectUtils;

import java.util.Collections;
import java.util.List;

@Service("departmentService")
@Transactional
public class DepartmentServiceImpl implements DepartmentService {

    @Autowired
    private DepartmentMapper departmentMapper;

    @Autowired
    private UserService userService;

    @Override
    public void addDepartment(Department department) {
        if (ObjectUtils.isEmpty(department)) {
            throw new IllegalArgumentException("");
        }

        this.departmentMapper.save(department);
    }

    @Override
    public void deleteDepartmentById(Long id) {
        if (ObjectUtils.isEmpty(id) || id <= 0) {
            throw new IllegalArgumentException("");
        }

        // TODO 根据ID查询用户，判断用户列表是否null，如果为null，则可以删除，如果不为null，则不可以删除
        List<User> userList = this.userService.findUserListByDepartmentId(id);
        if (CollectionUtils.isEmpty(userList)) {
            this.departmentMapper.deleteById(id);
        } else {
            throw new SsmException("该部门下有用户，不可以删除");
        }
    }

    @Override
    public List<Department> findAll() {
        return this.departmentMapper.findAll();
    }

    @Override
    public Department findDepartmentById(Long id) {
        if (ObjectUtils.isEmpty(id) || id <= 0) {
            throw new IllegalArgumentException("");
        }

        return this.departmentMapper.findById(id);
    }

    @Override
    public void modifyDepartment(Department department) {
        if (ObjectUtils.isEmpty(department)) {
            throw new IllegalArgumentException("");
        }

        this.departmentMapper.update(department);
    }
}
