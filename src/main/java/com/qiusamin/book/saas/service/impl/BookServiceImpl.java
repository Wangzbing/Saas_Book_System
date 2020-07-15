package com.qiusamin.book.saas.service.impl;

import com.qiusamin.book.saas.domain.dos.BookListDO;
import com.qiusamin.book.saas.domain.vo.BookListVo;
import com.qiusamin.book.saas.mapper.IBookMapper;
import com.qiusamin.book.saas.service.IBookService;
import com.qiusamin.book.saas.utils.ListCopyUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
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
}
