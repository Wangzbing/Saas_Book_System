package com.qiusamin.book.saas.contorller;

import com.qiusamin.book.saas.domain.vo.*;
import com.qiusamin.book.saas.service.IndexService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @author gutianbo
 */
@RestController
@RequestMapping("/index")
@Slf4j
public class IndexController {
    @Resource
    private IndexService indexService;
    /**
     * qry index data info
     * @return info data
     */
    @GetMapping
    private ModelAndView getIndexInfo(ModelAndView modelAndView){
        IndexVO indexInfo = indexService.getIndexInfo();
        Map<String, Object> model = modelAndView.getModel();
        model.put("indexInfo",indexInfo);
        modelAndView.setViewName("index");
        return modelAndView;
    }
}
