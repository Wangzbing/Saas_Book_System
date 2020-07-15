package com.qiusamin.book.saas.domain.dos;

import lombok.Data;

import java.util.Date;

/**
 * @author gutianbo
 * @version 1.0
 * @date 2020/07/15
 */
@Data
public class BookListDO {
    private Long bookId;
    private String bookName;
    private String bookAuthor;
    private String bookPublisher;
    private Integer bookScope;
    private String introduction;
    private String price;
    private Date publishDate;
    private String cover;
}
