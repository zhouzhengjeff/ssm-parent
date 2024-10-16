package com.hnguigu.ssm.service;

import com.hnguigu.ssm.entity.User;

import java.util.List;

public interface UserService {

    List<User> findUserListByDepartmentId(Long id);
}
