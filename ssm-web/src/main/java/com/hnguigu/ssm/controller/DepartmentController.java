package com.hnguigu.ssm.controller;

import com.hnguigu.ssm.entity.Department;
import com.hnguigu.ssm.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/departments")
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;

    /**
     * http://localhost:9999/departments
     * {
     * <p>
     * }
     *
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(@RequestBody Department department) {
        this.departmentService.addDepartment(department);
        return "success";
    }
}
