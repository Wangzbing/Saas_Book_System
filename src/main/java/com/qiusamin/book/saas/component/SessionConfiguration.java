package com.qiusamin.book.saas.component;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @author gu tianbo<br>
 * @version 1.0<br>
 */
@Configuration
public class SessionConfiguration implements WebMvcConfigurer {

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        InterceptorRegistration interceptor = registry.addInterceptor(new SessionInterceptor());
        /**
         * Add the intercepted path *
         * / for the root path
         * /* for the first-level path
         * /** for all paths including multi-level
         * */
        interceptor.addPathPatterns("/**");
        //Exclude those that are not blocked, including pages you login without blocking
        interceptor.excludePathPatterns("/login");
        //unlock
        interceptor.excludePathPatterns("/unlock");
        //login page
        interceptor.excludePathPatterns("/");
        //static source
        interceptor.excludePathPatterns("/static/**");
    }
}
