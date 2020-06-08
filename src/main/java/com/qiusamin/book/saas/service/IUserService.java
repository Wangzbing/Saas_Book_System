package com.qiusamin.book.saas.service;

import com.qiusamin.book.saas.domain.common.OutParams;
import com.qiusamin.book.saas.domain.vo.LoginVO;
import com.qiusamin.book.saas.domain.vo.PasswordVO;
import com.qiusamin.book.saas.domain.vo.SignUpVO;
import com.qiusamin.book.saas.domain.vo.UserVO;

import java.util.List;

/** The interface User service. */
public interface IUserService {
  /**
   * Qry user list list.
   *
   * @param pageNumber the page number
   * @param pageIndex the page index
   * @return the list
   */
  List<UserVO> qryUserList(int pageNumber, int pageIndex);

  /**
   * Login user vo.
   *
   * @param params the params
   * @return the user vo
   */
  UserVO login(LoginVO params);

  /**
   * Add sign user out params.
   *
   * @param signUpVO the sign up vo
   * @return the out params
   */
  OutParams<Object> addSignUser(SignUpVO signUpVO);

  /**
   * Audit user out params.
   *
   * @param userId the user id
   * @return the out params
   */
  OutParams<Object> auditUser(long userId);

  /**
   * Gets user info.
   *
   * @param userId the user id
   * @return the user info
   */
  OutParams<Object> getUserInfo(long userId);

  /**
   * Edit user info out params.
   *
   * @param userVO the user vo
   * @return the out params
   */
  OutParams<Object> editUserInfo(UserVO userVO);

  /**
   * Edit user contact out params.
   *
   * @param userVO the user vo
   * @return the out params
   */
  OutParams<Object> editUserContact(UserVO userVO);

  /**
   * Edit password out params.
   *
   * @param passwordVO the password vo
   * @return the out params
   */
  OutParams<Object> editPassword(PasswordVO passwordVO);
}
