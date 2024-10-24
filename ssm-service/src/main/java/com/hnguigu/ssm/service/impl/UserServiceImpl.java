package com.hnguigu.ssm.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hnguigu.ssm.entity.User;
import com.hnguigu.ssm.mapper.UserMapper;
import com.hnguigu.ssm.service.UserService;
import com.hnguigu.ssm.vo.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ObjectUtils;

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

    @Override
    public List<User> findAll() {
        return this.userMapper.findAll();
    }

    @Override
    public void deleteUserById(Long id) {
        if (ObjectUtils.isEmpty(id)) {
            throw new IllegalArgumentException("参数不合法");
        }

        this.userMapper.removeById(id);
    }

    @Override
    public PageInfo<User> findPagination(Integer pageNum, Integer pageSize) {
        PageInfo<User> pageInfo = null;

        if (ObjectUtils.isEmpty(pageNum) || pageNum <= 0 || ObjectUtils.isEmpty(pageSize) || pageSize <= 0) {
            throw new IllegalArgumentException("参数不合法");
        }

        PageHelper.startPage(pageNum, pageSize);
        List<User> userList = this.userMapper.findAll();
        pageInfo = new PageInfo<>(userList, 5);
        pageInfo.setPageNum(pageNum);
        pageInfo.setPageSize(pageSize);
        return pageInfo;
    }

    @Override
    public void addUser(User user) {
        if (ObjectUtils.isEmpty(user)) {
            throw new IllegalArgumentException("参数不合法");
        }

        this.userMapper.save(user);
    }

    @Override
    public User findUserId(Long id) {
        if (ObjectUtils.isEmpty(id) || id <= 0) {
            throw new IllegalArgumentException("参数不合法");
        }

        return this.userMapper.findById(id);
    }

    @Override
    public void modifyUser(User user) {
        if (ObjectUtils.isEmpty(user)) {
            throw new IllegalArgumentException("参数不合法");
        }

        this.userMapper.update(user);
    }

    @Override
    public PageBean<User> page(Integer pageNumber, Integer pageSize) {
        PageBean<User> pageBean = null;

        if (ObjectUtils.isEmpty(pageNumber) || pageNumber <= 0 || ObjectUtils.isEmpty(pageSize) || pageSize <= 0) {
            throw new IllegalArgumentException("参数不合法");
        }

        PageHelper.startPage(pageNumber, pageSize);
        List<User> userList = this.userMapper.findAll();

        PageInfo<User> pageInfo = new PageInfo<>(userList, 5);
        pageBean = new PageBean<>();
        pageBean.setTotal((int) pageInfo.getTotal());
        pageBean.setRows(userList);
        return pageBean;
    }
}
