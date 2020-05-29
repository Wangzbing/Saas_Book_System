package com.qiusamin.book.saas.endpoint.contorller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * this class all redirect to views
 * @author Gu Tianbo
 */
@Controller
public class HerfController {

    @RequestMapping("/index")
    private String index(ModelAndView modelAndView){
        return "index";
    }

    @RequestMapping("/profile")
    private String profile(ModelAndView modelAndView){
        return "profile";
    }

    @RequestMapping("/app/index")
    private String emailIndex(ModelAndView modelAndView){
        return "app/index";
    }

    @RequestMapping("/page-error")
    private String errorPage(ModelAndView modelAndView){
        return "pages-error";
    }

    @RequestMapping("/page-error-500")
    private String error500Page(ModelAndView modelAndView){
        return "pages-error-500";
    }
}
