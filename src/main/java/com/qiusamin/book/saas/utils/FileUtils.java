package com.qiusamin.book.saas.utils;

import org.springframework.core.io.ClassPathResource;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

/**
 * @author gu tianbo<br>
 * @version 1.0<br>
 */
public class FileUtils {
    /**
     * Upload a picture and return to the picture path
     * @param file file
     * @param request  request
     * @return  String  fileName
     */
    public static String upload(MultipartFile file, HttpServletRequest request) throws IOException {
        String fileName = file.getOriginalFilename();
        String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);
        //get real file Path
        ClassPathResource classPathResource = new ClassPathResource("static/images/user");
        File dir = classPathResource.getFile();
        //make a file
        String newFileName = getUniqueFileName();
        File f = new File(dir.getPath() + File.separator + newFileName + "." + suffix);
        //Copy the data in the input stream to a new file
        org.apache.commons.io.FileUtils.copyInputStreamToFile(file.getInputStream(), f);
        return newFileName + "." + suffix;
    }

    //Generate unique file names
    public static String getUniqueFileName(){
        String str = UUID.randomUUID().toString();
        return str.replace("-", "");
    }
}
