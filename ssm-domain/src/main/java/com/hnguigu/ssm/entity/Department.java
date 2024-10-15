package com.hnguigu.ssm.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Department implements Serializable {

    private static final long serialVersionUID = -1124768932124856258L;
    private Long id;
    private String name;
    private String location;
}