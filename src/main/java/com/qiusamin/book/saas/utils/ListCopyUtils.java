package com.qiusamin.book.saas.utils;

import org.springframework.beans.BeanUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Supplier;

/**
 * list copy utils
 */
public class ListCopyUtils extends BeanUtils {
    /**
     * Copy of collection data
     * @param sources: sources
     * @param target: target::new(eg: UserVO::new)
     * @return
     */
    public static <S, T> List<T> copyListProperties(List<S> sources, Supplier<T> target) {
        return copyListProperties(sources, target, null);
    }


    /**
     * Copy of set data with callback function (customizable field copy rules) copy of set data
     * @param sources: sources
     * @param target: target::new(eg: UserVO::new)
     * @param callBack: callback function
     * @return objects
     */
    public static <S, T> List<T> copyListProperties(List<S> sources, Supplier<T> target, BeanCopyUtilCallBack<S, T> callBack) {
        List<T> list = new ArrayList<>(sources.size());
        for (S source : sources) {
            T t = target.get();
            copyProperties(source, t);
            list.add(t);
            if (callBack != null) {
                // callback
                callBack.callBack(source, t);
            }
        }
        return list;
    }

    @FunctionalInterface
    public interface BeanCopyUtilCallBack<S, T> {
        /**
         * Define the default callback method
         * @param t source
         * @param s target
         */
        void callBack(S t, T s);
    }
}

