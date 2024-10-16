package com.hnguigu.ssm.vo;

public class Result<T> {

    /**
     * 标记
     * true | false
     */
    private String flag;

    /**
     * 状态码
     */
    private String code;

    /**
     * 后端向前端发送数据
     */
    private T data;


}
