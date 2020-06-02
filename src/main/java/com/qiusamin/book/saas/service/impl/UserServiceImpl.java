package com.qiusamin.book.saas.service.impl;

import com.qiusamin.book.saas.domain.dos.UserDO;
import com.qiusamin.book.saas.domain.vo.UserVO;
import com.qiusamin.book.saas.mapper.IUserMapper;
import com.qiusamin.book.saas.service.IUserService;
import com.qiusamin.book.saas.utils.ListCopyUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserServiceImpl implements IUserService {
    @Resource
    private IUserMapper userMapper;
    @Override
    public List<UserVO> qryUserList(int pageNumer, int pageIndex) {
        // All mappers return to DO
        List<UserDO> dos = userMapper.qryUserList(pageIndex, pageNumer);
        // All service are recipe VO
        return ListCopyUtils.copyListProperties(dos, UserVO::new);
    }
}
