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

    /**
     * 成功的结果
     * @param data
     * @return
     */
    public static Result success(Object data) {
        Result result = new Result();
        result.setFlag("true");
        result.setCode("200");
        result.setData(data);
        return result;
    }

    /**
     * 失败的结果
     * @param data
     * @return
     */
    public static Result fail(Object data) {
        Result result = new Result();
        result.setFlag("false");
        result.setCode("500");
        return result;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
