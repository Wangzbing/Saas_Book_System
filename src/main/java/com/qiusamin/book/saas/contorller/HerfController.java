package com.qiusamin.book.saas.contorller;

import com.qiusamin.book.saas.domain.common.OutParams;
import com.qiusamin.book.saas.domain.vo.*;
import com.qiusamin.book.saas.service.IUserService;
import com.qiusamin.book.saas.service.IndexService;
import com.qiusamin.book.saas.utils.FileUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
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
    @Resource
    private IndexService indexService;

    @RequestMapping(value = "/profile",method = RequestMethod.GET)
    public String profile(ModelAndView modelAndView,@RequestParam(name = "userId",required = false) long userId){
        return "profile";
    }
    @RequestMapping(value = "/profile/edit",method = RequestMethod.GET)
    public String editUser(ModelAndView modelAndView,@RequestParam(name = "userId",required = false) long userId){
        return "profile-edit";
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

    @RequestMapping(value = "/add/user",method = RequestMethod.POST)
    public ModelAndView userAdd(ModelAndView modelAndView,@Valid @ModelAttribute UserVO userVO,HttpServletRequest request){
        String fileName;
        String staticPath = this.getClass().getClassLoader().getResource("static/images/user").getFile();
        if (userVO.getHeadImageFile().getOriginalFilename()!=null){
            try {
                fileName = FileUtils.upload(userVO.getHeadImageFile(), request,staticPath);
            } catch (IOException e) {
                log.error(e.getMessage());
                modelAndView.setViewName("pages-error-500");
                return modelAndView;
            }
            if (!StringUtils.isEmpty(fileName)){
                userVO.setHeadImage(fileName);
            }else {
                userVO.setHeadImage("00.jpg");
            }
        }
        userService.addUserInfo(userVO);
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
    public ModelAndView login(ModelAndView modelAndView, @Valid @ModelAttribute LoginVO loginVO, HttpServletRequest request){
        UserVO userVO=userService.login(loginVO);
        if (userVO!=null && !StringUtils.isEmpty(userVO.getUserName())){
            if (userVO.getUserStatus().equals(3003)){
                modelAndView.getModel().put("data",userVO);
                modelAndView.setViewName("audit");
                return modelAndView;
            }
            HttpSession session = request.getSession(true);
            session.setAttribute("userInfo",userVO);
            session.setAttribute("locked",Boolean.FALSE);
            IndexVO indexInfo = indexService.getIndexInfo();
            Map<String, Object> model = modelAndView.getModel();
            model.put("indexInfo",indexInfo);
            model.put("userInfo",userVO);
            modelAndView.setViewName("index");
        } else {
            modelAndView.setViewName("sign-in");
        }
        return modelAndView;
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
    public ModelAndView unlock(ModelAndView modelAndView,String password,HttpServletRequest request){
        HttpSession session = request.getSession(true);
        Object userInfo = session.getAttribute("userInfo");
        UserVO userVO = new UserVO();
        BeanUtils.copyProperties(userInfo,userVO);
        if (userVO.getUserPassword().equals(password)){
            session.setAttribute("locked",Boolean.FALSE);
            IndexVO indexInfo = indexService.getIndexInfo();
            Map<String, Object> model = modelAndView.getModel();
            model.put("indexInfo",indexInfo);
            modelAndView.setViewName("index");
            return modelAndView;
        }
        modelAndView.setViewName("pages-lock-screen");
        return modelAndView;
    }

    @GetMapping("/signUp")
    public String signUp(ModelAndView modelAndView){
        return "sign-up";
    }

    @PostMapping("/signUp")
    public ModelAndView addUser(ModelAndView modelAndView, @Valid @ModelAttribute SignUpVO signUpVO){
        OutParams<Object> outParams=userService.addSignUser(signUpVO);
        Map<String, Object> model = modelAndView.getModel();
        model.put("msg",outParams.getMessage());
        model.put("flag",outParams.getFlag());
        if (outParams.getFlag()){
            model.put("data",outParams.getT());
            modelAndView.setViewName("audit");
        }else {
            modelAndView.setViewName("sign-up");
        }
        return modelAndView;
    }
    @GetMapping("/audit")
    public ModelAndView auditUser(ModelAndView modelAndView,@RequestParam("userId") long userId){
        OutParams<Object> outParams=userService.auditUser(userId);
        List<UserVO> vos = userService.qryUserList(1, 10);
        vos.forEach(s->{
            s.setHeadImage("../static/images/user/"+s.getHeadImage());
        });
        Map<String, Object> model = modelAndView.getModel();
        model.put("msg",outParams.getMessage());
        model.put("flag",outParams.getFlag());
        model.put("userList",vos);
        modelAndView.setViewName("user-list");
        return modelAndView;
    }

    @GetMapping("/edit")
    public ModelAndView edit(ModelAndView modelAndView,@RequestParam("userId") long userId){
        OutParams<Object> outParams=userService.getUserInfo(userId);
        Map<String, Object> model = modelAndView.getModel();
        model.put("msg",outParams.getMessage());
        model.put("flag",outParams.getFlag());
        model.put("data",(UserVO)outParams.getT());
        modelAndView.setViewName("profile-edit");
        return modelAndView;
    }

    @PostMapping("/edit/userBase")
    public ModelAndView edit(ModelAndView modelAndView, @Valid @ModelAttribute UserVO userVO,HttpServletRequest request){
        String staticPath = this.getClass().getClassLoader().getResource("static/images/user").getFile();
        String fileName =null;
        if ("00.jpg".equals(userVO.getHeadImage())||userVO.getHeadImageFile().getOriginalFilename()!=null){
            try {
                fileName = FileUtils.upload(userVO.getHeadImageFile(), request,staticPath);
            } catch (IOException e) {
                log.error(e.getMessage());
                modelAndView.setViewName("pages-error-500");
                return modelAndView;
            }
            if (!StringUtils.isEmpty(fileName)){
                userVO.setHeadImage(fileName);
            }else {
                userVO.setHeadImage("00.jpg");
            }
        }
        OutParams<Object> outParams=userService.editUserInfo(userVO);
        Map<String, Object> model = modelAndView.getModel();
        List<UserVO> vos = userService.qryUserList(1, 10);
        vos.forEach(s->{
            s.setHeadImage("../static/images/user/"+s.getHeadImage());
        });
        model.put("msg",outParams.getMessage());
        model.put("flag",outParams.getFlag());
        model.put("userList",vos);
        modelAndView.setViewName("user-list");
        return modelAndView;
    }

    @PostMapping("/edit/userContact")
    public ModelAndView editUserContact(ModelAndView modelAndView, @Valid @ModelAttribute UserVO userVO,HttpServletRequest request){
        OutParams<Object> outParams=userService.editUserContact(userVO);
        Map<String, Object> model = modelAndView.getModel();
        List<UserVO> vos = userService.qryUserList(1, 10);
        vos.forEach(s->{
            s.setHeadImage("../static/images/user/"+s.getHeadImage());
        });
        model.put("msg",outParams.getMessage());
        model.put("flag",outParams.getFlag());
        model.put("userList",vos);
        modelAndView.setViewName("user-list");
        return modelAndView;
    }
    @PostMapping("/edit/password")
    public ModelAndView editPassword(ModelAndView modelAndView, @Valid @ModelAttribute PasswordVO passwordVO, HttpServletRequest request){
        String newPassword = passwordVO.getNewPassword();
        String newPasswordVaild = passwordVO.getNewPasswordVaild();
        Map<String, Object> model = modelAndView.getModel();
        if (!newPassword.equals(newPasswordVaild)){
            OutParams<Object> outParams=userService.getUserInfo(passwordVO.getUserId());
            model.put("msg","password vailded has error");
            model.put("flag",outParams.getFlag());
            model.put("data",(UserVO)outParams.getT());
            modelAndView.setViewName("profile-edit");
            return modelAndView;
        }
        OutParams<Object> outParams=userService.editPassword(passwordVO);
        List<UserVO> vos = userService.qryUserList(1, 10);
        vos.forEach(s->{
            s.setHeadImage("../static/images/user/"+s.getHeadImage());
        });
        model.put("msg",outParams.getMessage());
        model.put("flag",outParams.getFlag());
        model.put("userList",vos);
        modelAndView.setViewName("user-list");
        return modelAndView;
    }
}
