package com.qiusamin.book.saas.domain.common;

/**
 * @author gu tianbo<br>
 * @version 1.0<br>
 * This class handles the return of the dao layer uniformly
 */
public class OutParams<T> {
    private T t;
    private String message;
    private Boolean flag;

    public T getT() {
        return t;
    }

    public void setT(T t) {
        this.t = t;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Boolean getFlag() {
        return flag;
    }

    public void setFlag(Boolean flag) {
        this.flag = flag;
    }
}
