package com.qiusamin.book.saas.domain.vo;

import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

/**
 * @author gu tianbo<br>
 * @version 1.0<br>
 */
public class SignUpVO {
    @NotBlank
    private String userName;
    @Email
    private String userEmail;
    @NotBlank
    @Length(min = 6,message = "length must over size 6")
    private String userPassword;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }
}
