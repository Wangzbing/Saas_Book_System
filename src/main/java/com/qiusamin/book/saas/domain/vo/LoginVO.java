package com.qiusamin.book.saas.domain.vo;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

/**
 * @author gu tianbo<br>
 * @version 1.0<br>
 */
@Getter
@Setter
public class LoginVO {
    @NotBlank
    @Email
    private String email;
    @NotBlank
    private String password;
}
