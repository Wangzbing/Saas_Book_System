package com.qiusamin.book.saas.endpoint.contorller;

import com.qiusamin.book.saas.domain.vo.LoginVO;
import com.qiusamin.book.saas.domain.vo.UserVO;
import com.qiusamin.book.saas.service.IUserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.util.ObjectUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;
import java.util.Map;

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
    public String profile(ModelAndView modelAndView,@RequestParam(name = "userId",required = false) long userId){
        return "profile";
    }

    @RequestMapping("/user/list")
    public ModelAndView userList(ModelAndView modelAndView){
        Map<String, Object> model = modelAndView.getModel();
        List<UserVO> vos = userService.qryUserList(1, 10);
        vos.forEach(s->{
            s.setHeadImage("../static/images/user/"+s.getHeadImage());
        });
        model.put("userList",vos);
        modelAndView.setViewName("user-list");
        return modelAndView;
    }

    @RequestMapping(value = "/user/add",method = RequestMethod.GET)
    public ModelAndView addUser(ModelAndView modelAndView){
        modelAndView.setViewName("add-user");
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

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(ModelAndView modelAndView, @Valid @ModelAttribute LoginVO loginVO, HttpServletRequest request){
        UserVO userVO=userService.login(loginVO);
        if (userVO!=null && !StringUtils.isEmpty(userVO.getUserName())){
            modelAndView.getModel().put("userInfo",userVO);
            HttpSession session = request.getSession(true);
            session.setAttribute("userInfo",userVO);
            session.setAttribute("locked",Boolean.FALSE);
            return "index";
        } else {
            return "sign-in";
        }
    }

    @RequestMapping("/logout")
    public String logout(ModelAndView modelAndView,HttpServletRequest request){
        request.getSession().invalidate();
        return "sign-in";
    }

    @RequestMapping("/")
    public String helloPage(ModelAndView modelAndView){
        return "sign-in";
    }

    @RequestMapping("/calendar")
    public String calendar(ModelAndView modelAndView){
        return "calendar";
    }

    @RequestMapping("/chat")
    public String chat(ModelAndView modelAndView){
        return "chat";
    }
    @GetMapping("/lock")
    public String lock(ModelAndView modelAndView,HttpServletRequest request){
        HttpSession session = request.getSession(true);
        if (session.getAttribute("locked") != null) {
            session.setAttribute("locked", Boolean.TRUE);
        }
        return "pages-lock-screen";
    }

    @PostMapping("/unlock")
    public String unlock(ModelAndView modelAndView,String password,HttpServletRequest request){
        HttpSession session = request.getSession(true);
        Object userInfo = session.getAttribute("userInfo");
        UserVO userVO = new UserVO();
        BeanUtils.copyProperties(userInfo,userVO);
        if (userVO.getUserPassword().equals(password)){
            session.setAttribute("locked",Boolean.FALSE);
            return "index";
        }
        return "pages-lock-screen";
    }
}
