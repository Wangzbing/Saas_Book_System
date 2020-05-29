package com.qiusamin.book.saas.component;

import org.springframework.boot.web.server.ErrorPage;
import org.springframework.boot.web.server.ErrorPageRegistrar;
import org.springframework.boot.web.server.ErrorPageRegistry;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;

/**
 * @author Gu Tianbo
 */
@Component
public class MyError implements ErrorPageRegistrar {

    @Override
    public void registerErrorPages(ErrorPageRegistry registry) {
        /* display the wrong webpage according to the wrong type */
        /* The error type is 404, if the webpage cannot be found, the 404.html webpage is displayed by default */
        ErrorPage e404 = new ErrorPage(HttpStatus.NOT_FOUND, "/page-error");
        /*The error type is 500, indicating that the server responds with an error, and the 500.html webpage is displayed by default*/
        ErrorPage e500 = new ErrorPage(HttpStatus.INTERNAL_SERVER_ERROR, "/page-error-500");
        registry.addErrorPages(e404, e500);
    }
}
