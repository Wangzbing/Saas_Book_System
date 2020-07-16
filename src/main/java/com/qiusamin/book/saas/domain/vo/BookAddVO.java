package com.qiusamin.book.saas.domain.vo;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.Date;

/**
 * @author wangzb
 * @version 1.0
 * @date 2020/07/16
 */
@Data
public class BookAddVO {
    @NotBlank
    private String bookName;
    @NotBlank
    private String bookAuthor;
    @NotBlank
    private String bookPublisher;
    @NotNull
    private Integer scope;
    @NotBlank
    private String introduction;
    @NotBlank
    private String price;
    @NotBlank
    private String publishDate;
    private Date publish;
    private String cover;
    private MultipartFile coverFile;
    private Long userId;
    private Date createTime=new Date();
}
