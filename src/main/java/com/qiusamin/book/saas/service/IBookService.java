package com.qiusamin.book.saas.service;

import com.qiusamin.book.saas.domain.vo.BookListVo;

import java.util.List;

/**
 * bookService
 * @author gutianbo
 */
public interface IBookService {

    List<BookListVo> qryBookList();
}
