package com.hnguigu.ssm.mapper;

import com.hnguigu.ssm.entity.User;

import java.util.List;

public interface UserMapper {

    List<User> findUsersByDepartmentId(Long id);

    List<User> findAll();

    void removeById(Long id);

    void save(User user);

    User findById(Long id);

    void update(User user);

}
