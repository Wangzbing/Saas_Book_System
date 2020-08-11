package com.qiusamin.book.saas.mapper;

import com.qiusamin.book.saas.domain.vo.BookLikesListVO;
import com.qiusamin.book.saas.domain.vo.StaticDataListVO;
import com.qiusamin.book.saas.domain.vo.StaticSystemInfoVO;
import com.qiusamin.book.saas.domain.vo.UserBizSaleList;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author gutianbo
 */
@Mapper
public interface IndexMapper {
  /**
   * qry Static Data List
   *
   * @return list
   */
  @Select(
        "SELECT  "
      + "  'user rate' AS dataName,(  "
      + "  SELECT  "
      + "    count( b.user_id )/ count( a.user_id )*100  "
      + "  FROM  "
      + "    user_info b   "
      + "  WHERE  "
      + "    QUARTER ( b.create_time )= QUARTER (  "
      + "    NOW())) AS 'rate',(  "
      + "  SELECT  "
      + "    count( c.user_id )   "
      + "  FROM  "
      + "    user_info c   "
      + "  WHERE  "
      + "    QUARTER ( c.create_time ) = QUARTER (  "
      + "    now())) AS 'data'   "
      + "FROM  "
      + "  user_info a UNION ALL  "
      + "SELECT  "
      + "  'book rate' AS dataName,(  "
      + "  SELECT  "
      + "    count( x.book_id )/ count( y.book_id )*100  "
      + "  FROM  "
      + "    book_info x   "
      + "  WHERE  "
      + "    QUARTER ( x.create_time )= QUARTER (  "
      + "    NOW())) AS 'rate',(  "
      + "  SELECT  "
      + "    count( z.book_id )   "
      + "  FROM  "
      + "    book_info z   "
      + "  WHERE  "
      + "    QUARTER ( z.create_time ) = QUARTER (  "
      + "    now())) AS 'data'   "
      + "FROM  "
      + "  book_info y UNION ALL  "
      + "SELECT  "
      + "  'sale rate' AS dataName,(  "
      + "  SELECT  "
      + "    count( x.sale_id )/ count( y.sale_id )*100  "
      + "  FROM  "
      + "    sell_info x   "
      + "  WHERE  "
      + "    QUARTER ( x.create_time )= QUARTER (  "
      + "    NOW())) AS 'rate',(  "
      + "  SELECT  "
      + "    count( z.sale_id )   "
      + "  FROM  "
      + "    sell_info z   "
      + "  WHERE  "
      + "    QUARTER ( z.create_time ) = QUARTER (  "
      + "    now())) AS 'data'   "
      + "FROM  "
      + "  sell_info y UNION  "
      + "SELECT  "
      + "  'rent rate' AS dataName,(  "
      + "  SELECT  "
      + "    count( x.rent_id )/ count( y.rent_id )*100   "
      + "  FROM  "
      + "    rent_info x   "
      + "  WHERE  "
      + "    QUARTER ( x.create_time )= QUARTER (  "
      + "    NOW())) AS 'rate',(  "
      + "  SELECT  "
      + "    count( z.rent_id )   "
      + "  FROM  "
      + "    rent_info z   "
      + "  WHERE  "
      + "    QUARTER ( z.create_time ) = QUARTER (  "
      + "    now())) AS 'data'   "
      + "FROM  "
      + "  rent_info y")
  List<StaticDataListVO> qryStaticDataList();
  /**
   * qry Sale List
   *
   * @return list
   */
  @Results({
          @Result(column = "sale_id", property = "saleId"),
          @Result(column = "book_id", property = "bookId"),
          @Result(column = "book_name", property = "bookName"),
          @Result(column = "book_price", property = "price"),
          @Result(column = "numer", property = "number"),
          @Result(column = "discount", property = "discount"),
          @Result(column = "user_name", property = "userName"),
          @Result(column = "create_time", property = "createTime"),
          @Result(column = "total", property = "total")
  })
  @Select(
        "SELECT  "
      + "  a.sale_id,  "
      + "  a.book_id,  "
      + "  b.book_name,  "
      + "  b.book_price,  "
      + "  a.numer,  "
      + "  b.book_price *IF( c.user_vip_level = 3008, IF ( c.user_vip_level = 3009, 0.8, 0.9 ), 0.7 ) AS total,  "
      + "  c.user_name,  "
      + "  a.create_time,  "
      + "  IF( c.user_vip_level = 3008, IF ( c.user_vip_level = 3009, '80%', '90%' ), '70%' ) AS discount   "
      + "FROM  "
      + "  sell_info a,  "
      + "  book_info b,  "
      + "  user_info c   "
      + "WHERE  "
      + "   a.book_id = b.book_id   "
      + "  AND a.buy_user_id = c.user_id   "
      + "ORDER BY  "
      + "  a.create_time DESC   "
      + "  LIMIT 4")
  List<UserBizSaleList> qrySaleList();
  /**
   * get Static SystemInfo
   *
   * @return list
   */
  @Select(
        "SELECT  "
      + "  COUNT( a.user_id ) AS number,  "
      + "  'add user' AS infoName   "
      + "FROM  "
      + "  user_info a   "
      + "WHERE  "
      + "  DAYOFYEAR( a.create_time )= DAYOFYEAR(  "
      + "  NOW())   "
      + "  AND a.user_status = 3001 UNION ALL  "
      + "SELECT  "
      + "  COUNT( a.user_id ) AS number,  "
      + "  'register user' AS infoName   "
      + "FROM  "
      + "  user_info a   "
      + "WHERE  "
      + "  DAYOFYEAR( a.create_time )= DAYOFYEAR(  "
      + "  NOW())   "
      + "  AND a.user_status = 3003 UNION ALL  "
      + "SELECT  "
      + "  COUNT( a.book_id ) AS number,  "
      + "  'add book' AS infoName   "
      + "FROM  "
      + "  book_info a   "
      + "WHERE  "
      + "  DAYOFYEAR( a.create_time )= DAYOFYEAR(  "
      + "  NOW()) UNION ALL  "
      + "SELECT  "
      + "  COUNT( a.sale_id ) AS number,  "
      + "  'sale book' AS infoName   "
      + "FROM  "
      + "  sell_info a   "
      + "WHERE  "
      + "  DAYOFYEAR( a.create_time )= DAYOFYEAR(  "
      + "  NOW()) UNION ALL  "
      + "SELECT  "
      + "  COUNT( a.rent_id ) AS number,  "
      + "  'rent user' AS infoName   "
      + "FROM  "
      + "  rent_info a   "
      + "WHERE  "
      + "  DAYOFYEAR( a.create_time )= DAYOFYEAR(  "
      + "  NOW())")
  List<StaticSystemInfoVO> getStaticSystemInfo();
  /**
   * qry Book Likes List
   *
   * @return list
   */
  @Results({
          @Result(column = "book_name",property = "bookName"),
          @Result(column = "book_cover",property = "bookCover"),
          @Result(column = "rate",property = "rate"),
          @Result(column = "book_id",property = "bookId"),
          @Result(column = "saleNumber",property = "saleNumber"),
          @Result(column = "rent_count",property = "rentNumber"),
  })
  @Select(
      "SELECT  "
    + "  x.book_name,  "
    + "  x.book_cover,  "
    + "  y.saleNumber / x.book_store_number*100 as rate,  "
    + "  x.book_id,  "
    + "  y.saleNumber,(  "
    + "  SELECT  "
    + "    SUM( b.book_id )   "
    + "  FROM  "
    + "    rent_info b   "
    + "  WHERE  "
    + "    b.book_id = x.book_id   "
    + "  GROUP BY  "
    + "    b.book_id   "
    + "  ) AS rent_count   "
    + "FROM  "
    + "  book_info x,(  "
    + "  SELECT  "
    + "    a.sale_id,  "
    + "    SUM( a.numer ) AS saleNumber   "
    + "  FROM  "
    + "    sell_info a   "
    + "  GROUP BY  "
    + "    a.book_id   "
    + "  ORDER BY  "
    + "    saleNumber DESC   "
    + "  ) AS y   "
    + "WHERE  "
    + "  x.book_id = y.sale_id  "
    + "  AND x.deleted =0"
    + "  ORDER BY y.saleNumber DESC  "
    + "Limit 4"
  )
  List<BookLikesListVO> qryBookLikesList();
}
