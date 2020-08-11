package com.qiusamin.book.saas.service.impl;

import com.qiusamin.book.saas.domain.dos.BookListDO;
import com.qiusamin.book.saas.domain.vo.BookAddVO;
import com.qiusamin.book.saas.domain.vo.BookEditBaseVO;
import com.qiusamin.book.saas.domain.vo.BookListVo;
import com.qiusamin.book.saas.domain.vo.BookSaleInfoVO;
import com.qiusamin.book.saas.mapper.IBookMapper;
import com.qiusamin.book.saas.service.IBookService;
import com.qiusamin.book.saas.utils.ListCopyUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

/**
 * @author gutianbo
 */
@Service
public class BookServiceImpl implements IBookService {

    @Resource
    private IBookMapper bookMapper;

    @Override
    public List<BookListVo> qryBookList() {
        List<BookListDO> dos=bookMapper.qryBookList();
        return ListCopyUtils.copyListProperties(dos, BookListVo::new);
    }

    /**
     * add book
     *
     * @param addVO book add vo
     */
    @Override
    public void addBook(BookAddVO addVO) throws ParseException {
        // handle publish date
        SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd");
        addVO.setPublish(sdf.parse(addVO.getPublishDate()));
        bookMapper.addBook(addVO);
    }

    /**
     * according  id to query info
     *
     * @param bookId book id
     * @return bookInfo
     */
    @Override
    public BookListVo getBookInfo(Long bookId) {
        return bookMapper.findBook(bookId);
    }

    /**
     * edit book base
     * @throws ParseException 时间解析
     * @param editBaseVO edit base info
     */
    @Override
    public void editBaseInfo(BookEditBaseVO editBaseVO) throws ParseException {
        // handle publish date
        SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd");
        editBaseVO.setPublish(sdf.parse(editBaseVO.getPublishDate()));
        bookMapper.editBaseInfo(editBaseVO);
    }

    /**
     * edit book sale info
     * @param saleInfo sale info
     */
    @Override
    public void editDetail(BookSaleInfoVO saleInfo) {
        bookMapper.editSale(saleInfo);
    }

    /**
     * deleted book
     *
     * @param bookId book id
     */
    @Override
    public void deletedBook(Long bookId) {
        bookMapper.deletedBook(bookId);
    }
}
