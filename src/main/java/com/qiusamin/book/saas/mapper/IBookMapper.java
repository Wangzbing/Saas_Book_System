package com.qiusamin.book.saas.mapper;

import com.qiusamin.book.saas.domain.dos.BookListDO;
import com.qiusamin.book.saas.domain.vo.BookAddVO;
import com.qiusamin.book.saas.domain.vo.BookListVo;
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
}
