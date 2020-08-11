package com.qiusamin.book.saas.contorller.book;

import com.qiusamin.book.saas.domain.vo.BizListVO;
import com.qiusamin.book.saas.domain.vo.UserVO;
import com.qiusamin.book.saas.service.BizService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * this class all redirect to book management views
 * @author Gu Tianbo
 */
@Controller
@RequestMapping("/biz")
@Slf4j
public class BizController {
    @Resource
    private BizService bizService;

    @GetMapping("/rent")
    public ModelAndView rent(ModelAndView modelAndView, @RequestParam("bookId")Long bookId, HttpServletRequest request){
        UserVO userInfo = (UserVO) request.getSession().getAttribute("userInfo");
        bizService.rentBook(bookId, userInfo);
        return qryBizList(modelAndView, userInfo);
    }
    @GetMapping("/sale")
    public ModelAndView sale(ModelAndView modelAndView, @RequestParam("bookId")Long bookId, HttpServletRequest request){
        UserVO userInfo = (UserVO) request.getSession().getAttribute("userInfo");
        bizService.saleBook(bookId,userInfo);
        return qryBizList(modelAndView, userInfo);
    }
    @GetMapping
    public ModelAndView all(ModelAndView modelAndView,HttpServletRequest request){
        UserVO userInfo = (UserVO) request.getSession().getAttribute("userInfo");
        return qryBizList(modelAndView, userInfo);
    }

    private ModelAndView qryBizList(ModelAndView modelAndView, UserVO userInfo) {
        BizListVO bizListVO=bizService.qryBizList(userInfo.getUserId());
        Map<String, Object> model = modelAndView.getModel();
        model.put("bizList",bizListVO);
        modelAndView.setViewName("book-rent");
        return modelAndView;
    }
}
