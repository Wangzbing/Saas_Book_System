package com.qiusamin.book.saas.contorller.book;

import com.qiusamin.book.saas.domain.vo.BookAddVO;
import com.qiusamin.book.saas.domain.vo.BookListVo;
import com.qiusamin.book.saas.domain.vo.UserVO;
import com.qiusamin.book.saas.service.IBookService;
import com.qiusamin.book.saas.utils.FileUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
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
    @Resource
    private IBookService bookService;

    private final static String coverPath="static/images/cover";

    @GetMapping("/list")
    public ModelAndView list(ModelAndView modelAndView){
        return getBookList(modelAndView);
    }

    /**
    * get book list
    * @param modelAndView model and view
    * @return book list
    */
    private ModelAndView getBookList(ModelAndView modelAndView) {
        List<BookListVo> vos =bookService.qryBookList();
        Map<String, Object> model = modelAndView.getModel();
        model.put("bookList",vos);
        modelAndView.setViewName("book-list");
        return modelAndView;
    }

    @GetMapping("/add")
    public ModelAndView add(ModelAndView modelAndView){
        modelAndView.setViewName("add-book");
        return modelAndView;
    }
    @GetMapping("/edit")
    public ModelAndView edit(ModelAndView modelAndView, @RequestParam("bookId")Long bookId){
        BookListVo data=bookService.getBookInfo(bookId);
        modelAndView.setViewName("book_edit");
        Map<String, Object> model = modelAndView.getModel();
        model.put("data",data);
        return modelAndView;
    }

    @PostMapping("/add")
    public ModelAndView addBook(ModelAndView modelAndView, @Valid @ModelAttribute BookAddVO addVO, HttpServletRequest request){
        String fileName;
        String staticPath = this.getClass().getClassLoader().getResource(coverPath).getFile();
        UserVO userInfo = (UserVO)request.getSession().getAttribute("userInfo");
        if (addVO.getCoverFile().getOriginalFilename()!=null){
            try {
                fileName = FileUtils.upload(addVO.getCoverFile(), request,staticPath);
            } catch (IOException e) {
                log.error(e.getMessage());
                modelAndView.setViewName("pages-error-500");
                return modelAndView;
            }
            if (!StringUtils.isEmpty(fileName)){
                addVO.setCover(".." + File.separator + coverPath + File.separator + fileName);
            }else {
                addVO.setCover(".." + File.separator + coverPath + File.separator + "00.jpg");
            }
        }
        try {
            addVO.setUserId(userInfo.getUserId());
            bookService.addBook(addVO);
        } catch (ParseException e) {
            log.error(e.getMessage());
            modelAndView.setViewName("pages-error-500");
            return modelAndView;
        }
        return getBookList(modelAndView);
    }

}
