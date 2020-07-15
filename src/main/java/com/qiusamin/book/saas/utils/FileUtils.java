package com.qiusamin.book.saas.utils;

import org.springframework.core.io.ClassPathResource;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
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
     * @param staticPath
     * @return  String  fileName
     */
    public static String upload(MultipartFile file, HttpServletRequest request, String staticPath) throws IOException {
        String fileName = file.getOriginalFilename();
        String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);
        //get real file Path
        String newFileName = getUniqueFileName();
        File s = new File(staticPath+ File.separator + newFileName + "." + suffix);
        InputStream fis =file.getInputStream();
        FileOutputStream fos1 = new FileOutputStream(s);
        int len;
        byte[] buffer = new byte[4096];
        while ((len = fis.read(buffer)) > 0) {
            fos1.write(buffer, 0, len);
        }
        return newFileName + "." + suffix;
    }

    /**
    *  generate unique file names
    * @return fileName
    */
    public static String getUniqueFileName(){
        String str = UUID.randomUUID().toString();
        return str.replace("-", "");
    }
}
