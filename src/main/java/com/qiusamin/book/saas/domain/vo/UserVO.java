package com.qiusamin.book.saas.domain.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

/**
 * @author gu<br>
 * @version 1.0<br>
 * @date 2020/06/02 <br>
 */
@Getter
@Setter
public class UserVO {
    private Long userId;
    private String userName;
    private String userEmail;
    private Date joinDate;
    private String userCountry;
    private Integer userStatus;
    private String userPhone;
    private String headImage;
    private String userPassword;
}
