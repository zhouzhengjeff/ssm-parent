package com.hnguigu.ssm.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.io.Serializable;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class User implements Serializable {


    private static final long serialVersionUID = 682816547646407187L;
    private Long id;
    private String name;
    private String password;
    private Float salary;
    private Date birthday;

    private Long departmentId;
}