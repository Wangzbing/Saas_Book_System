package com.qiusamin.book.saas.domain.vo;

import lombok.Data;

/**
 * @author gutianbo
 */
@Data
public class BookLikesListVO {
    private String bookName;
    private Long bookId;
    private String bookCover;
    private Double rate;
    private Integer rentNumber;
    private Integer saleNumber;
}
