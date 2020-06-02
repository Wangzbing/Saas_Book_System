package com.qiusamin.book.saas.domain.dos;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

/**
 * <Description> <br>
 *
 * @author gu <br>
 * @version 1.0<br>
 * @date 2020/06/02 <br>
 */
@Getter
@Setter
public class UserDO {
    private Long userId;
    private String userName;
    private String userEmail;
    private Date joinDate;
    private String userCountry;
    private Integer userStatus;
    private String userPhone;
}
