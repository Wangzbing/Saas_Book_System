package com.qiusamin.book.saas.service;

import com.qiusamin.book.saas.domain.vo.LoginVO;
import com.qiusamin.book.saas.domain.vo.UserVO;

import java.util.List;

public interface IUserService {
  List<UserVO> qryUserList(int pageNumber, int pageIndex);

  UserVO login(LoginVO params);
}
