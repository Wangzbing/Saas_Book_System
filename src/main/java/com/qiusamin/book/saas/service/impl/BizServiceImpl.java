package com.qiusamin.book.saas.service.impl;

import com.qiusamin.book.saas.domain.entity.BookRentEntity;
import com.qiusamin.book.saas.domain.entity.BookSaleEntity;
import com.qiusamin.book.saas.domain.vo.BizListVO;
import com.qiusamin.book.saas.domain.vo.BookListVo;
import com.qiusamin.book.saas.domain.vo.UserBizSaleList;
import com.qiusamin.book.saas.domain.vo.UserVO;
import com.qiusamin.book.saas.mapper.BizMapper;
import com.qiusamin.book.saas.mapper.IBookMapper;
import com.qiusamin.book.saas.mapper.IUserMapper;
import com.qiusamin.book.saas.service.BizService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * BizServiceImpl
 * @author gutianbo
 */
@Service
public class BizServiceImpl implements BizService {
    @Resource
    private IBookMapper bookMapper;
    @Resource
    private BizMapper bizMapper;
    @Resource
    private IUserMapper userMapper;
    /**
     * rent book
     *
     * @param bookId   book id
     * @param userInfo user info
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void rentBook(Long bookId, UserVO userInfo) {
        BookRentEntity bookRentEntity = new BookRentEntity();
        BookListVo book = bookMapper.findBook(bookId);
        bookRentEntity.setBookId(book.getBookId());
        bookRentEntity.setBookName(book.getBookName());
        bookRentEntity.setCreateTime(new Date());
        //SimpleDateFormat
        Calendar c = Calendar.getInstance();
        c.setTimeInMillis(System.currentTimeMillis());
        c.add(Calendar.DATE, 5);
        Date oldDate= new Date(c.getTimeInMillis());
        bookRentEntity.setEndTime(oldDate);
        bookRentEntity.setDeleted(false);
        bookRentEntity.setRentStatus(7001);
        bookRentEntity.setRentUserId(userInfo.getUserId());
        bizMapper.rentBook(bookRentEntity);
    }

    /**
     * sale book
     *
     * @param bookId   book id
     * @param userInfo user info
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void saleBook(Long bookId, UserVO userInfo) {
        BookSaleEntity bookSaleEntity = new BookSaleEntity();
        BookListVo book = bookMapper.findBook(bookId);
        if (book.getStoreNumber()<1){
            throw new RuntimeException("库存不足");
        }
        bookSaleEntity.setBookId(book.getBookId());
        bookSaleEntity.setBookName(book.getBookName());
        bookSaleEntity.setCreateDate(new Date());
        //SimpleDateFormat
        SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Calendar c = Calendar.getInstance();
        c.setTimeInMillis(System.currentTimeMillis());
        c.add(Calendar.DATE, 5);
        Date oldDate= new Date(c.getTimeInMillis());
        bookSaleEntity.setBookPrice(book.getPrice());
        bookSaleEntity.setDeleted(false);
        bookSaleEntity.setBuyUserId(userInfo.getUserId());
        bookSaleEntity.setNumber(1);
        bizMapper.saleBook(bookSaleEntity);
        bookMapper.storeNumber(bookId);
    }

    /**
     * qry biz list
     *
     * @param userId user id
     * @return bizListVO
     */
    @Override
    public BizListVO qryBizList(Long userId) {
        BizListVO listVO = bizMapper.qryBizList(userId);
        List<UserBizSaleList> saleList = listVO.getSaleList();
        saleList.forEach(s->{
            BigDecimal price = new BigDecimal(s.getPrice());
            String discount = s.getDiscount();
            String[] split = discount.split("0");
            BigDecimal disCount = new BigDecimal("0." + split[0]);
            s.setTotal(price.multiply(disCount).toString());
        });
        return listVO;
    }
}
