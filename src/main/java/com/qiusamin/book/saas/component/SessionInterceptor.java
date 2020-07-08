package com.qiusamin.book.saas.component;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author gu tianbo<br>
 * @version 1.0<br>
 */
public class SessionInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        if ("/".equals(request.getRequestURI())) {
            return true;
        }
        //Verify that the session exists
        Object user = request.getSession().getAttribute("userInfo");
        Object locked = request.getSession().getAttribute("locked");
        if (user == null) {
            response.sendRedirect("/");
            return false;
        }
        if (locked==null||(Boolean) locked){
            response.sendRedirect("/lock");
            return false;
        }
        return true;
    }
}
