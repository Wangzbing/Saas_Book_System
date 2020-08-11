package com.qiusamin.book.saas.service;

import com.qiusamin.book.saas.domain.vo.BizListVO;
import com.qiusamin.book.saas.domain.vo.UserVO;

/**
 * bizService
 * @author gutianbo
 */
public interface BizService {
  /**
   * rent book
   * @param bookId book id
   * @param userInfo user info
   */
  void rentBook(Long bookId, UserVO userInfo);

  /**
   * sale book
   * @param bookId book id
   * @param userInfo user info
   */
  void saleBook(Long bookId, UserVO userInfo);

  /**
   * qry biz list
   * @param userId user id
   * @return bizListVO
   */
  BizListVO qryBizList(Long userId);
}
