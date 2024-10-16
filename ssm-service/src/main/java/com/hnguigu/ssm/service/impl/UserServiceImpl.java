package com.hnguigu.ssm.service.impl;

import com.hnguigu.ssm.entity.User;
import com.hnguigu.ssm.mapper.UserMapper;
import com.hnguigu.ssm.service.DepartmentService;
import com.hnguigu.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ObjectUtils;

import java.util.Collections;
import java.util.List;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public List<User> findUserListByDepartmentId(Long id) {
        if (ObjectUtils.isEmpty(id) || id <= 0) {
            throw new IllegalArgumentException("参数不合法");
        }

        return this.userMapper.findUsersByDepartmentId(id);
    }
}
