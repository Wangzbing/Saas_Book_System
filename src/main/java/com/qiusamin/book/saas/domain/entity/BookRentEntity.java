package com.qiusamin.book.saas.domain.entity;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

/**
 * @author gutianbo
 */
@Getter
@Setter
public class BookRentEntity {
    private String  bookName;
    private Long bookId;
    private Integer rentStatus;
    private Long rentUserId;
    private Boolean deleted;
    private Date createTime;
    private Date endTime;
}
