package com.qiusamin.book.saas.domain.vo;

import lombok.Data;

import java.util.List;

/**
 * @author gutianbo
 */
@Data
public class IndexVO {
    private List<StaticDataListVO> dataList;
    private List<UserBizSaleList> saleList;
    private List<StaticSystemInfoVO> infoList;
    private List<BookLikesListVO> bookList;
}
