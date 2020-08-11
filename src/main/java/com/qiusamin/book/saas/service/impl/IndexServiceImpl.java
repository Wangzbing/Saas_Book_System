package com.qiusamin.book.saas.service.impl;

import com.qiusamin.book.saas.domain.vo.*;
import com.qiusamin.book.saas.mapper.BizMapper;
import com.qiusamin.book.saas.mapper.IBookMapper;
import com.qiusamin.book.saas.mapper.IndexMapper;
import com.qiusamin.book.saas.service.IndexService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author gutianbo
 */
@Service
public class IndexServiceImpl implements IndexService {
    @Resource
    private IndexMapper indexMapper;
    /**
     * get index info
     *
     * @return indexVO
     */
    @Override
    public IndexVO getIndexInfo() {
        IndexVO indexVO = new IndexVO();
        indexVO.setDataList(indexMapper.qryStaticDataList());
        indexVO.setSaleList(indexMapper.qrySaleList());
        indexVO.setInfoList(indexMapper.getStaticSystemInfo());
        indexVO.setBookList(indexMapper.qryBookLikesList());
        return indexVO;
    }
}
