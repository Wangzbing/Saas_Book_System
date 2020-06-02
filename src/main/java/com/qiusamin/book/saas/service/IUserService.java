package com.qiusamin.book.saas.service;

import com.qiusamin.book.saas.domain.vo.UserVO;

import java.util.List;

public interface IUserService {
  List<UserVO> qryUserList(int pageNumer, int pageIndex);
}
