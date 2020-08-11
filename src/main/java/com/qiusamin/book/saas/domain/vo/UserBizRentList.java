package com.qiusamin.book.saas.domain.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

/**
 * @author gutianbo
 */
@Getter
@Setter
public class UserBizRentList {
    private Long rentId;
    private Long bookId;
    private String bookName;
    private Date rentTime;
    private Date endTime;
    private Integer rentStatus;
    private String statusName;
}
