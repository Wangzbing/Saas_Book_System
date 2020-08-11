package com.qiusamin.book.saas.domain.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

/**
 * @author gutianbo
 */
@Getter
@Setter
public class UserBizSaleList {
    private Long saleId;
    private Long bookId;
    private String bookName;
    private String price;
    private String number;
    private String discount;
    private String total;
    private Date createTime;
    private String userName;
}
