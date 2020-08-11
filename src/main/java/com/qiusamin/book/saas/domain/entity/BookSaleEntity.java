package com.qiusamin.book.saas.domain.entity;

import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.Date;

/**
 * @author gutianbo
 */
@Getter
@Setter
public class BookSaleEntity {
    private String  bookName;
    private Long bookId;
    private String bookPrice;
    private Long buyUserId;
    private Integer number;
    private Boolean deleted;
    private Date createDate;
    private String total;
}
