package com.qiusamin.book.saas.contorller.book;

import com.qiusamin.book.saas.domain.vo.BookListVo;
import com.qiusamin.book.saas.service.IBookService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

/**
 * this class all redirect to book management views
 * @author Gu Tianbo
 */
@Controller
@RequestMapping("/book")
@Slf4j
public class ManagerController {
    @Autowired
    private IBookService bookService;

    @GetMapping("/list")
    public ModelAndView list(ModelAndView modelAndView){
        List<BookListVo> vos =bookService.qryBookList();
        Map<String, Object> model = modelAndView.getModel();
        model.put("bookList",vos);
        modelAndView.setViewName("book-list");
        return modelAndView;
    }
}
