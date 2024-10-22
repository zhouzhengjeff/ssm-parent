package com.hnguigu.ssm.controller;

import com.github.pagehelper.PageInfo;
import com.hnguigu.ssm.entity.Department;
import com.hnguigu.ssm.service.DepartmentService;
import com.hnguigu.ssm.vo.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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

    @GetMapping
    @ResponseBody
    public Result findAll() {
        List<Department> departmentList = this.departmentService.findAll();
        return Result.success(departmentList);
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

    @RequestMapping(value = "/page/{pageNum}/{pageSize}", method = RequestMethod.GET)
    public String page(@PathVariable Integer pageNum, @PathVariable Integer pageSize, Model model) {

        if (pageNum == 0) {
            pageNum = 1;
        }

        PageInfo<Department> pageInfo = this.departmentService.findPagination(pageNum, pageSize);

        boolean hasPreviousPage = pageInfo.isHasPreviousPage();
        boolean hasNextPage = pageInfo.isHasNextPage();

        if (!hasPreviousPage) {
            pageInfo.setPageNum(1);
        }

        if (!hasNextPage) {
            pageInfo.setPageNum(pageInfo.getPages());
        }

        model.addAttribute("pageInfo", pageInfo);
        return "department/pager";
    }


}
