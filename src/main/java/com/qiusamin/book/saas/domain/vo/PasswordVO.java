package com.qiusamin.book.saas.domain.vo;

/**
 * @author gu tianbo<br>
 * @version 1.0<br>
 */
public class PasswordVO {
    private String password;
    private String newPassword;
    private String newPasswordVaild;
    private Long userId;

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }

    public String getNewPasswordVaild() {
        return newPasswordVaild;
    }

    public void setNewPasswordVaild(String newPasswordVaild) {
        this.newPasswordVaild = newPasswordVaild;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }
}
