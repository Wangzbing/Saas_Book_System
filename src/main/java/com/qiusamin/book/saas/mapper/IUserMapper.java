package com.qiusamin.book.saas.mapper;

import com.qiusamin.book.saas.domain.dos.UserDO;
import com.qiusamin.book.saas.domain.entity.UserEntity;
import com.qiusamin.book.saas.domain.vo.LoginVO;
import com.qiusamin.book.saas.domain.vo.PasswordVO;
import com.qiusamin.book.saas.domain.vo.SignUpVO;
import com.qiusamin.book.saas.domain.vo.UserVO;
import org.apache.ibatis.annotations.*;

import java.util.List;

/** The interface User mapper. */
@Mapper
public interface IUserMapper {
  /**
   * query user list by paging params
   *
   * @param pageIndex page index
   * @param pageNumber page number
   * @return user list
   */
  @Results(
      id = "userInfo",
      value = {
        @Result(column = "user_id", property = "userId"),
        @Result(column = "user_name", property = "userName"),
        @Result(column = "user_email", property = "userEmail"),
        @Result(column = "user_join_date", property = "joinDate"),
        @Result(column = "user_country", property = "userCountry"),
        @Result(column = "user_status", property = "userStatus"),
        @Result(column = "user_phone", property = "userPhone"),
        @Result(column = "user_sex", property = "userSex"),
        @Result(column = "user_head_img", property = "headImage"),
        @Result(column = "password", property = "userPassword"),
        @Result(column = "user_comment", property = "userComment"),
      })
  @Select("select * from user_info a where a.deleted=0")
  List<UserDO> qryUserList(int pageIndex, int pageNumber);

  /**
   * check login info
   *
   * @param params login vo params
   * @return int user do
   */
  @ResultMap("userInfo")
  @Select(
      "select * from user_info a where a.user_email= #{params.email} and a.password= #{params.password} and a.deleted=0")
  UserDO checkUser(@Param("params") LoginVO params);

  /**
   * add user by signUp
   *
   * @param userEntity userEntity
   * @return UserDo to getUserId;
   */
  int addSignUser(UserEntity userEntity);

  /**
   * get user count
   *
   * @param signUpVO sign up vo
   * @return int User count
   */
  @Select(
      "select COUNT(1) from user_info a where a.deleted=0 and (a.user_name = #{param.userName} or a.user_email=#{param.userEmail}) ")
  int checkNameAndEmail(@Param("param") SignUpVO signUpVO);

  /**
   * Number of affected rows
   *
   * @param userId userId
   * @return Number of affected rows
   */
  @Update("UPDATE `user_info` SET `user_status` = 3001 WHERE `user_id` = #{userId}")
  int auditUser(@Param("userId") long userId);

  /**
   * Edit user info int.
   *
   * @param userVO the user vo
   * @return the int
   */
  @Update(
      "<script>"
          + "UPDATE `user_info` a SET a.user_name=#{user.userName},"
          + "<if test='user.headImage!=null and user.headImage.length>0'>"
          + "a.user_head_img=#{user.headImage},"
          + "</if>"
          + "a.user_sex=#{user.userSex},a.user_country=#{user.userCountry}  "
          + "WHERE `user_id` = #{user.userId}"
          + "</script>")
  int editUserInfo(@Param("user") UserVO userVO);

  /**
   * getUserInfo BY Id
   *
   * @param userId userId
   * @return userDO user info
   */
  @ResultMap("userInfo")
  @Select("select * from user_info a where a.deleted=0 and a.user_id=#{userId}")
  UserDO getUserInfo(@Param("userId") long userId);

  /**
   * Edit user contact int.
   *
   * @param userVO the user vo
   * @return the int
   */
  @Update(
      "UPDATE `user_info` a SET a.user_phone=#{user.userPhone},a.user_comment=#{user.userComment}  "
          + "WHERE `user_id` = #{user.userId}")
  int editUserContact(@Param("user") UserVO userVO);

  /**
   * Edit password int.
   *
   * @param passwordVO the password vo
   * @return the int
   */
  @Update(
      "UPDATE `user_info` a SET a.password=#{bean.newPassword}"
          + " WHERE `user_id` = #{bean.userId}")
  int editPassword(@Param("bean") PasswordVO passwordVO);
}
