package com.hnguigu.ssm.service;

import com.github.pagehelper.PageInfo;
import com.hnguigu.ssm.entity.User;

import java.util.List;

public interface UserService {

    List<User> findUserListByDepartmentId(Long id);

    List<User> findAll();

    void deleteUserById(Long id);

    PageInfo<User> findPagination(Integer pageNum, Integer pageSize);

    void addUser(User user);

    User findUserId(Long id);

    void modifyUser(User user);
}
