package com.hnguigu.ssm.exception;

/**
 * 自定义异常
 */
public class SsmException extends RuntimeException {

    private String message;

    public SsmException() {

    }

    public SsmException(String message) {
        super(message);
        this.message = message;
    }

    @Override
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
