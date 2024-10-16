package com.hnguigu.ssm.service;

import com.hnguigu.ssm.entity.Department;

import java.util.List;

public interface DepartmentService {

    void addDepartment(Department department);

    /**
     * 根据ID删除部门
     * @param id
     */
    void deleteDepartmentById(Long id);

    List<Department> findAll();

    Department findDepartmentById(Long id);

    void modifyDepartment(Department department);
}
