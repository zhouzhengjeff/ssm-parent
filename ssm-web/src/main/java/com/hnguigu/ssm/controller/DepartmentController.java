package com.hnguigu.ssm.controller;

import com.hnguigu.ssm.entity.Department;
import com.hnguigu.ssm.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
@RequestMapping("/departments")
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;

    @RequestMapping(value = "/findAll", method = RequestMethod.GET)
    public String findAll(Model model) {
        List<Department> departmentList = this.departmentService.findAll();
        model.addAttribute("departmentList", departmentList);
        return "department/list";

    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(@RequestBody Department department) {
        this.departmentService.addDepartment(department);
        return "success";
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String delete(@PathVariable Long id) {
        this.departmentService.deleteDepartmentById(id);
        return "redirect:/departments/findAll";
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String edit(@PathVariable Long id, Model model) {
        Department department = departmentService.findDepartmentById(id);
        model.addAttribute("department", department);
        return "department/edit";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String edit(Department department) {
        this.departmentService.modifyDepartment(department);
        return "redirect:/departments/findAll";
    }




}
