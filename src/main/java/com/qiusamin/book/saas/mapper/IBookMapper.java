package com.qiusamin.book.saas.mapper;

import com.qiusamin.book.saas.domain.dos.BookListDO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

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
  @Select("select * from book_info order by create_time desc")
  List<BookListDO> qryBookList();
}
