package com.qiusamin.book.saas.domain.vo;

import lombok.Data;

/**
 * @author gutianbo
 * @date 2020/07/17
 */
@Data
public class BookSaleInfoVO {
    private String bookScope;
    private String price;
    private Integer storeNumber;
    private Long bookId;
}
