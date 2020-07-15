package com.qiusamin.book.saas.service.impl;

import com.qiusamin.book.saas.domain.common.OutParams;
import com.qiusamin.book.saas.domain.dos.UserDO;
import com.qiusamin.book.saas.domain.entity.UserEntity;
import com.qiusamin.book.saas.domain.vo.LoginVO;
import com.qiusamin.book.saas.domain.vo.PasswordVO;
import com.qiusamin.book.saas.domain.vo.SignUpVO;
import com.qiusamin.book.saas.domain.vo.UserVO;
import com.qiusamin.book.saas.mapper.IUserMapper;
import com.qiusamin.book.saas.service.IUserService;
import com.qiusamin.book.saas.utils.ListCopyUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/** The type User service. */
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
        // handle email to lowercase
        params.setEmail(params.getEmail().toLowerCase());
        UserDO userDO=userMapper.checkUser(params);
        UserVO userVO = new UserVO();
        if (userDO != null) {
            BeanUtils.copyProperties(userDO, userVO);
            String userImg = userVO.getHeadImage();
            userVO.setHeadImage("../static/images/user/"+userImg);
        }
        return userVO;
    }

    @Override
    public OutParams<Object> addSignUser(SignUpVO signUpVO) {
        OutParams<Object> out = new OutParams<>();
        // handle email to lowercase
        String s = signUpVO.getUserEmail().toLowerCase();
        signUpVO.setUserEmail(s);
        int i = userMapper.checkNameAndEmail(signUpVO);
        if (i!=0){
            out.setFlag(false);
            out.setMessage("repeatable email or name");
            return out;
        }
        UserEntity userEntity = new UserEntity();
        BeanUtils.copyProperties(signUpVO,userEntity);
        userEntity.setJoinDate(new Date());
        // The current avatar defaults to 00.jpg, which can be modified after login
        userEntity.setHeadImage("00.jpg");
        // user status 3003 mean the account must wait admin to audit
        userEntity.setUserStatus(3003);
        userEntity.setUserSex("male");
        userEntity.setDeleted(false);
        userEntity.setCreateTime(new Date());
        int count = userMapper.addSignUser(userEntity);
        if (userEntity.getUserId()>0){
            out.setFlag(Boolean.TRUE);
            out.setMessage("success");
            out.setT(userEntity);
            return out;
        }else {
            out.setFlag(false);
            out.setMessage("insert fail");
            return out;
        }
    }

    @Override
    public OutParams<Object> auditUser(long userId) {
        OutParams<Object> out = new OutParams<>();
        int i = userMapper.auditUser(userId);
        if (i==1){
            out.setFlag(true);
            out.setMessage("update success");
        }else {
            out.setFlag(false);
            out.setMessage("failed");
        }
        return out;
    }

    @Override
    public OutParams<Object> getUserInfo(long userId) {
        OutParams<Object> out = new OutParams<>();
        UserDO userDO=userMapper.getUserInfo(userId);
        if (userDO!=null &&!StringUtils.isEmpty(userDO.getUserName())){
            out.setFlag(true);
            out.setMessage("success");
        }else {
            out.setFlag(false);
            out.setMessage("can`t find user");
            return out;
        }
        UserVO userVO = new UserVO();
        BeanUtils.copyProperties(userDO,userVO);
        userVO.setHeadImage("../static/images/user/"+userVO.getHeadImage());
        out.setT(userVO);
        return out;
    }

    @Override
    public OutParams<Object> editUserInfo(UserVO userVO) {
        OutParams<Object> out = new OutParams<>();
        int i = userMapper.editUserInfo(userVO);
        if(i==1){
            out.setFlag(Boolean.TRUE);
        }else {
            out.setFlag(Boolean.FALSE);
        }
        return out;
    }

    @Override
    public OutParams<Object> editUserContact(UserVO userVO) {
        OutParams<Object> out = new OutParams<>();
        int i = userMapper.editUserContact(userVO);
        if(i==1){
            out.setFlag(Boolean.TRUE);
        }else {
            out.setFlag(Boolean.FALSE);
        }
        return out;
    }

    @Override
    public OutParams<Object> editPassword(PasswordVO passwordVO) {
        OutParams<Object> out = new OutParams<>();
        UserDO userInfo = userMapper.getUserInfo(passwordVO.getUserId());
        if (!userInfo.getUserPassword().equals(passwordVO.getPassword())){
            out.setFlag(Boolean.FALSE);
            out.setMessage("密码错误");
            return out;
        }
        int i = userMapper.editPassword(passwordVO);
        if(i==1){
            out.setFlag(Boolean.TRUE);
        }else {
            out.setFlag(Boolean.FALSE);
        }
        return out;
    }

    /**
     * add user
     *
     * @param userVO userInfo
     * @return the out params
     */
    @Override
    public OutParams<Object> addUserInfo(UserVO userVO) {
        OutParams<Object> out = new OutParams<>();
        // handle email to lowercase
        String s = userVO.getUserEmail().toLowerCase();
        userVO.setUserEmail(s);
        UserEntity userEntity = new UserEntity();
        BeanUtils.copyProperties(userVO,userEntity);
        userEntity.setJoinDate(new Date());
        // The current avatar defaults to 00.jpg, which can be modified after login
        // user status 3003 mean the account must wait admin to audit
        userEntity.setUserStatus(3001);
        userEntity.setDeleted(false);
        userEntity.setCreateTime(new Date());
        int count = userMapper.addSignUser(userEntity);
        if (userEntity.getUserId()>0){
            out.setFlag(Boolean.TRUE);
            out.setMessage("success");
            out.setT(userEntity);
            return out;
        }else {
            out.setFlag(false);
            out.setMessage("insert fail");
            return out;
        }
    }
}
