package com.qiusamin.book.saas.mapper;

import com.qiusamin.book.saas.domain.entity.BookRentEntity;
import com.qiusamin.book.saas.domain.entity.BookSaleEntity;
import com.qiusamin.book.saas.domain.vo.BizListVO;
import com.qiusamin.book.saas.domain.vo.UserBizRentList;
import com.qiusamin.book.saas.domain.vo.UserBizSaleList;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;

import java.util.List;

/**
 * @author gutianbo
 */
@Mapper
public interface BizMapper {

  /**
   * add rent
   * @param bookRentEntity rent entity
   *  */
  @Insert("INSERT INTO `saas_book`.`rent_info`" +
          "(`rent_user_id`, `rent_status`, `deleted`, `create_time`, `end_time`, `book_id`, `book_name`)" +
          " VALUES " +
          "(#{bean.rentUserId}, #{bean.rentStatus}, #{bean.deleted}, #{bean.createTime},#{bean.endTime}, #{bean.bookId}, #{bean.bookName})")
  void rentBook(@Param("bean") BookRentEntity bookRentEntity);

  /**
   * add sale
   * @param bookSaleEntity sale entity
   *  */
  @Insert("INSERT INTO `saas_book`.`sell_info`" +
          "(`sale_price`, `buy_user_id`, `numer`, `deleted`, `create_time`, `book_name`,`book_id`) " +
          "VALUES" +
          " (#{bean.bookPrice}, #{bean.buyUserId},  #{bean.number},  #{bean.deleted},  #{bean.createDate},  #{bean.bookName},#{bean.bookId})")
  void saleBook(@Param("bean") BookSaleEntity bookSaleEntity);

  /**
   * qry biz list
   *
   * @param userId user id
   * @return biz list vo
   */
  @Results({
          @Result(column = "user_status",property = "status"),
          @Result(column = "user_vip_level",property = "vipLevel"),
          @Result(column = "manager_phone",property = "managerPhone"),
          @Result(column = "user_address",property = "address"),
          @Result(column = "user_account_money",property = "userAccount"),
          @Result(column = "user_id",property = "rentList",
                  many = @Many(select = "com.qiusamin.book.saas.mapper.BizMapper.qryRentList",fetchType = FetchType.EAGER)),
          @Result(column = "user_id",property = "saleList",
                  many = @Many(select = "com.qiusamin.book.saas.mapper.BizMapper.qrySaleList",fetchType = FetchType.EAGER))
  })
  @Select(
      "SELECT  "
    + "  a.user_id,  "
    + "  b.dic_name as user_status,  "
    + "  c.dic_name as user_vip_level,  "
    + "  user_account_money,  "
    + "  a.user_address,  "
    + "  '+1234567' as manager_phone  "
    + "FROM  "
    + "  user_info a  "
    + "  LEFT JOIN dic_info b on a.user_status =b.dic_code  "
    + "  LEFT JOIN dic_info c on a.user_vip_level =c.dic_code  "
    + "WHERE  "
    + "  a.user_id =#{userId}")
  BizListVO qryBizList(Long userId);

  /**
   * according user id qry rent list
   * @param userId userId
   * @return list
   */
  @Results({
          @Result(column = "rent_id",property = "rentId"),
          @Result(column = "book_id",property = "bookId"),
          @Result(column = "book_name",property = "bookName"),
          @Result(column = "create_time",property = "rentTime"),
          @Result(column = "end_time",property = "endTime"),
          @Result(column = "rent_status",property = "rentStatus"),
          @Result(column = "status",property = "statusName"),
  })
  @Select("SELECT a.rent_id,b.book_id ,b.book_name,a.create_time,a.end_time,a.rent_status,c.dic_name as `status`  " +
          "FROM rent_info a LEFT JOIN dic_info c ON a.rent_status = c.dic_code,book_info b " +
          "WHERE " +
          " a.rent_user_id =#{userId} " +
          " AND a.book_id = b.book_id " +
          " ORDER BY a.create_time DESC " +
          " Limit 5 ")
  List<UserBizRentList> qryRentList(Long userId);
  /**
   * according user id qry sale list
   *
   * @param userId userId
   * @return list
   */
  @Results({
    @Result(column = "sale_id", property = "saleId"),
    @Result(column = "book_id", property = "bookId"),
    @Result(column = "book_name", property = "bookName"),
    @Result(column = "book_price", property = "price"),
    @Result(column = "numer", property = "number"),
    @Result(column = "discount", property = "discount"),
  })
  @Select(
      "SELECT  "
    + "  a.sale_id,  "
    + "  a.book_id,  "
    + "  b.book_name,  "
    + "  b.book_price,  "
    + "  a.numer,  "
    + "  IF( c.user_vip_level = 3008, IF ( c.user_vip_level = 3009, '80%', '90%' ), '70%' ) AS discount   "
    + "FROM  "
    + "  sell_info a,  "
    + "  book_info b,  "
    + "  user_info c   "
    + "WHERE  "
    + "  a.buy_user_id = #{userId} "
    + "  AND a.book_id = b.book_id   "
    + "  AND a.buy_user_id = c.user_id  "
    + "ORDER BY a.create_time DESC "
    + "Limit 5")
  List<UserBizSaleList> qrySaleList(Long userId);
}
