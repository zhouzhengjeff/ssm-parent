package com.hnguigu.ssm.mapper;

import com.github.pagehelper.PageInfo;
import com.hnguigu.ssm.entity.Department;

import java.util.List;

public interface DepartmentMapper {

    void save(Department department);

    void deleteById(Long id);

    List<Department> findAll();

    Department findById(Long id);

    void update(Department department);

}
