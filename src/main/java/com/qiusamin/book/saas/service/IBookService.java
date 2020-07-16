package com.qiusamin.book.saas.service;

import com.qiusamin.book.saas.domain.vo.BookAddVO;
import com.qiusamin.book.saas.domain.vo.BookListVo;

import java.text.ParseException;
import java.util.List;

/**
 * bookService
 * @author gutianbo
 */
public interface IBookService {

  /**
   * qry book list
   * @return book list
   */
  List<BookListVo> qryBookList();

  /**
   * add book
   * @param addVO  add vo
   * @throws ParseException time parse exception
   */
  void addBook(BookAddVO addVO) throws ParseException;

    /**
    * according  id to query info
    * @param bookId book id
    * @return bookInfo
    */
    BookListVo getBookInfo(Long bookId);
}
