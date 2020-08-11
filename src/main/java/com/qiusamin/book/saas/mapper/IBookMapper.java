package com.qiusamin.book.saas.mapper;

import com.qiusamin.book.saas.domain.dos.BookListDO;
import com.qiusamin.book.saas.domain.vo.BookAddVO;
import com.qiusamin.book.saas.domain.vo.BookEditBaseVO;
import com.qiusamin.book.saas.domain.vo.BookListVo;
import com.qiusamin.book.saas.domain.vo.BookSaleInfoVO;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author gutianbo
 */
@Mapper
public interface IBookMapper {

  /**
   * qry book list
   * @return bookList
   *  */
  @Results({
          @Result(column = "book_id",property = "bookId"),
          @Result(column = "book_name",property = "bookName"),
          @Result(column = "book_author",property = "bookAuthor"),
          @Result(column = "book_publisher",property = "bookPublisher"),
          @Result(column = "book_scope",property = "bookScope"),
          @Result(column = "book_brief_introduction",property = "introduction"),
          @Result(column = "book_price",property = "price"),
          @Result(column = "published_date",property = "publishDate"),
          @Result(column = "book_cover",property = "cover"),
  })
  @Select("select * from book_info a where a.deleted =0 order by create_time desc")
  List<BookListDO> qryBookList();

  @Insert(
      "INSERT INTO book_info "
          + "( book_name, book_author, book_publisher, book_price, book_scope,book_brief_introduction, book_cover, create_user, create_time,published_date ) "
          + " VALUES "
          + "(#{bean.bookName},#{bean.bookAuthor},#{bean.bookPublisher},#{bean.price},#{bean.scope},#{bean.introduction},#{bean.cover},#{bean.userId},#{bean.createTime},#{bean.publish})")
  void addBook(@Param("bean") BookAddVO addVO);

  /** get book info
   * @param bookId book id
   * @return book info
   */
  @Results({
          @Result(column = "book_id",property = "bookId"),
          @Result(column = "book_name",property = "bookName"),
          @Result(column = "book_author",property = "bookAuthor"),
          @Result(column = "book_publisher",property = "bookPublisher"),
          @Result(column = "book_scope",property = "bookScope"),
          @Result(column = "book_brief_introduction",property = "introduction"),
          @Result(column = "book_price",property = "price"),
          @Result(column = "published_date",property = "publishDate"),
          @Result(column = "book_cover",property = "cover"),
          @Result(column = "book_ISBN",property = "bookIsbn"),
          @Result(column = "book_store_number",property = "storeNumber"),
  })
  @Select("select * from book_info a where a.book_id=#{bookId} and a.deleted=0")
  BookListVo findBook(Long bookId);

  /**
   * edit base info
   * @param editBaseVO base vo
   */
  @Update("<script>" +
          "UPDATE `book_info` SET " +
          "`book_name` = #{bean.bookName}," +
          "`book_author` = #{bean.bookAuthor}," +
          "`book_publisher` = #{bean.bookPublisher}," +
          "`book_brief_introduction` = #{bean.introduction}," +
          "`published_date` = #{bean.publish}," +
          "<if test='bean.cover!=null'>" +
          " `book_cover` = #{bean.cover}," +
          "</if>" +
          "`book_ISBN` = #{bean.bookIsbn} " +
          " WHERE `book_id` = #{bean.bookId}" +
          "</script>")
  void editBaseInfo(@Param("bean") BookEditBaseVO editBaseVO);

  /**
   * edit book sale info
   * @param saleInfo  sale info vo
   * */
  @Update("UPDATE `book_info` SET " +
          "`book_price` = #{bean.price}," +
          "`book_scope` = #{bean.bookScope}," +
          "`book_store_number` = #{bean.storeNumber} " +
          " WHERE `book_id` = #{bean.bookId}"
  )
  void editSale(@Param("bean") BookSaleInfoVO saleInfo);

  /**
   * deleted book
   * @param bookId book id
   */
  @Update("update `book_info` set `deleted` =1 WHERE `book_id` = #{bookId}")
  void deletedBook(@Param("bookId") Long bookId);
  /**
   * storeNumber book
   * @param bookId book id
   */
  @Update("update `book_info` set `book_store_number` =book_store_number-1 WHERE `book_id` = #{bookId}")
  void storeNumber(Long bookId);
}
