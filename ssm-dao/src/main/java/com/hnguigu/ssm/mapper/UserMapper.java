package com.hnguigu.ssm.mapper;

import com.hnguigu.ssm.entity.User;

import java.util.List;

public interface UserMapper {

    List<User> findUsersByDepartmentId(Long id);
}
