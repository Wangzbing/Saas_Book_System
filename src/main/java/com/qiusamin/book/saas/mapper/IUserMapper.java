package com.qiusamin.book.saas.mapper;

import com.qiusamin.book.saas.domain.dos.UserDO;
import com.qiusamin.book.saas.domain.vo.UserVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface IUserMapper {
    @Results({
            @Result(column = "user_id",property = "userId"),
            @Result(column = "user_name",property = "userName"),
            @Result(column = "user_email",property = "userEmail"),
            @Result(column = "user_join_date",property = "joinDate"),
            @Result(column = "user_country",property = "userCountry"),
            @Result(column = "user_status",property = "userStatus"),
            @Result(column = "user_phone",property = "userPhone"),
    })
    @Select("select * from user_info a where a.deleted=0")
    List<UserDO> qryUserList(int pageIndex, int pageNumer);
}
