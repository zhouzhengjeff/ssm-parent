package com.hnguigu.ssm.controller;


import com.github.pagehelper.PageInfo;
import com.hnguigu.ssm.entity.User;
import com.hnguigu.ssm.service.UserService;
import com.hnguigu.ssm.vo.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/users")
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping(value = "/index")
    public String index() {
        return "user/list4";
    }

    @GetMapping
    @ResponseBody
    public Result findAll() {
        List<User> userList = this.userService.findAll();
        return Result.success(userList);
    }

    @GetMapping(value = "/{id}")
    @ResponseBody
    public Result findById(@PathVariable Long id) {
        User user = this.userService.findUserId(id);
        return Result.success(user);
    }

    /*@PostMapping
    @ResponseBody
    public Result add(User user) {
        this.userService.addUser(user);
        return Result.success(null);
    }*/

    @PostMapping
    @ResponseBody
    public Result add(@RequestBody User user) {
        this.userService.addUser(user);
        return Result.success(null);
    }

    @GetMapping(value = "/page/{pageNum}/{pageSize}")
    @ResponseBody
    public Result page(@PathVariable Integer pageNum, @PathVariable Integer pageSize) {
        PageInfo<User> pageInfo = this.userService.findPagination(pageNum, pageSize);
        return Result.success(pageInfo);
    }

    @DeleteMapping(value = "/{id}")
    @ResponseBody
    public Result delete(@PathVariable Long id) {
        this.userService.deleteUserById(id);
        return Result.success(null);
    }

    @PutMapping
    @ResponseBody
    public Result update(@RequestBody User user) {
        this.userService.modifyUser(user);
        return Result.success(null);
    }


}
