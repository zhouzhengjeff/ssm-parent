package com.hnguigu.ssm.service.impl;

import com.hnguigu.ssm.entity.Department;
import com.hnguigu.ssm.service.DepartmentService;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class DepartmentServiceImplTest {

    private ApplicationContext context;
    private DepartmentService departmentService;

    @Before
    public void setUp() throws Exception {
        this.context = new ClassPathXmlApplicationContext("applicationContext-service.xml","applicationContext-dao.xml");
        this.departmentService = (DepartmentService) this.context.getBean("departmentService");
    }

    @Test
    public void testAddDepartment() {
        Department department = new Department();
        department.setName("SUN");
        department.setLocation("LOS");

        this.departmentService.addDepartment(department);
    }
}