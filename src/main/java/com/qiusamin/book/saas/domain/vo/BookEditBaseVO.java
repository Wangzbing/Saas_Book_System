package com.qiusamin.book.saas.domain.vo;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

/**
 * @author gutianbo
 */
@Data
public class BookEditBaseVO {
    private String bookName;
    private String bookAuthor;
    private String introduction;
    private String bookPublisher;
    private String publishDate;
    private Date publish;
    private String bookIsbn;
    private MultipartFile coverFile;
    private String cover;
    private Long bookId;
}
