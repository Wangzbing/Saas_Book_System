package com.qiusamin.book.saas.mapper;

import com.qiusamin.book.saas.domain.dos.UserDO;
import com.qiusamin.book.saas.domain.vo.LoginVO;
import lombok.Setter;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface IUserMapper {
  /**
   * query user list by paging params
   * @param pageIndex page index
   * @param pageNumber page number
   * @return user list
   */
  @Results(id = "userInfo",value = {
    @Result(column = "user_id", property = "userId"),
    @Result(column = "user_name", property = "userName"),
    @Result(column = "user_email", property = "userEmail"),
    @Result(column = "user_join_date", property = "joinDate"),
    @Result(column = "user_country", property = "userCountry"),
    @Result(column = "user_status", property = "userStatus"),
    @Result(column = "user_phone", property = "userPhone"),
    @Result(column = "user_head_img", property = "headImage"),
    @Result(column = "password", property = "userPassword"),
  })
  @Select("select * from user_info a where a.deleted=0")
  List<UserDO> qryUserList(int pageIndex, int pageNumber);

  /**
   * check login info
   * @param params login vo params
   * @return int
   */
  @ResultMap("userInfo")
  @Select("select * from user_info a where a.user_email= #{params.email} and a.password= #{params.password} and a.deleted=0 and a.user_status=3001")
  UserDO checkUser(@Param("params") LoginVO params);
}
