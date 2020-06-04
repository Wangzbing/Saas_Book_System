package com.qiusamin.book.saas.service.impl;

import com.qiusamin.book.saas.domain.dos.UserDO;
import com.qiusamin.book.saas.domain.vo.LoginVO;
import com.qiusamin.book.saas.domain.vo.UserVO;
import com.qiusamin.book.saas.mapper.IUserMapper;
import com.qiusamin.book.saas.service.IUserService;
import com.qiusamin.book.saas.utils.ListCopyUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserServiceImpl implements IUserService {
    @Resource
    private IUserMapper userMapper;
    @Override
    public List<UserVO> qryUserList(int pageNumber, int pageIndex) {
        // All mappers return to DO
        List<UserDO> dos = userMapper.qryUserList(pageIndex, pageNumber);
        // All service are recipe VO
        return ListCopyUtils.copyListProperties(dos, UserVO::new);
    }

    @Override
    public UserVO login(LoginVO params) {
        UserDO userDO=userMapper.checkUser(params);
        UserVO userVO = new UserVO();
        if (userDO != null) {
            BeanUtils.copyProperties(userDO, userVO);
            String userImg = userVO.getHeadImage();
            userVO.setHeadImage("../static/images/user/"+userImg);
        }
        return userVO;
    }
}
