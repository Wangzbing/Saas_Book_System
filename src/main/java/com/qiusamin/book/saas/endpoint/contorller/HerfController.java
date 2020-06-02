package com.qiusamin.book.saas.endpoint.contorller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.qiusamin.book.saas.domain.vo.UserVO;
import com.qiusamin.book.saas.service.IUserService;
import com.qiusamin.book.saas.utils.JsonUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
import java.util.Random;

/**
 * this class all redirect to views
 * @author Gu Tianbo
 */
@Controller
@Slf4j
public class HerfController {

    @Resource
    private IUserService userService;

    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String index(ModelAndView modelAndView){
        return "index";
    }

    @RequestMapping(value = "/profile",method = RequestMethod.GET)
    public String profile(ModelAndView modelAndView){
        return "profile";
    }

    @RequestMapping("/user/list")
    public ModelAndView userList(ModelAndView modelAndView){
        Map<String, Object> model = modelAndView.getModel();
        List<UserVO> vos = userService.qryUserList(1, 10);
        vos.forEach(s->{
            int i = new Random().nextInt(10);
            s.setUserImg("../static/images/user/0"+i+".jpg");
        });
        model.put("userList",vos);
        modelAndView.setViewName("user-list");
        return modelAndView;
    }

    @RequestMapping("/coming")
    public String coming(ModelAndView modelAndView){
        return "pages-comingsoon";
    }

    @RequestMapping("/app/index")
    public String emailIndex(ModelAndView modelAndView){
        return "app/index";
    }

    @RequestMapping("/page-error")
    public String errorPage(ModelAndView modelAndView){
        return "pages-error";
    }

    @RequestMapping("/page-error-500")
    public String error500Page(ModelAndView modelAndView){
        return "pages-error-500";
    }

    @RequestMapping("/login")
    public String login(ModelAndView modelAndView){
        Map<String, Object> model = modelAndView.getModel();
        return "login";
    }
}
