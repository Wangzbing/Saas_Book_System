package com.qiusamin.book.saas.utils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.TypeReference;
import com.alibaba.fastjson.serializer.SerializerFeature;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author Gu Tianbo
 * @version 1.0
 * @date 2020/06/02
 */
public class JsonUtils {
    /**
     * json to object
     * @param json json
     * @param t class
     * @param <T> in
     * @return object
     */

    public static  <T> T JsonToObject(String json,Class<T> t){
        if(null != json&&null != t) {
            try{
                return JSONObject.parseObject(json, t);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    /**
     * json to Map
     * @param json string json
     * @param keyType key type
     * @param valueType value objecy
     * @param <K> map key
     * @param <V> map value
     * @return map
     */

    public  static  <K, V>  Map<K, V> jsonToMap(String json, Class<K> keyType, Class<V> valueType) {

        if(null != json&&null != keyType&&null != valueType) {
            try{
                return  JSON.parseObject(json, new  TypeReference<Map<K, V>>(keyType, valueType){});
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    /**
     * Convert java objects to JSON data
     * The fastJson conversion string defaults to ignoring the display of the null field. When converting, the SerializerFeature.WriteMapNullValue is null will also be displayed     * @param o java对象
     * @return JSON  data
     */
    public static <T>  String objectToJsonString(T o){
        if(null != o) {
            try{
                return JSONObject.toJSONString(o, SerializerFeature.WriteMapNullValue);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    /**
     *  json string to Array
     * @param json jsonString
     * @param t object type
     * @return  object
     */
    public static <T> Object[] jsonToArray(String json, Class<T> t) {
        if(null != json) {
            try{
                return JSON.parseArray(json, t).toArray();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    /**
     * json to list
     * @param json JSON data
     * @param t  The specified java object t is empty, the default is jsonObject type
     * @return List<T> list
     */
    public static <T> List<T> jsonToList(String json, Class<T> t) {
        if(null != json) {
            try{
                return JSON.parseArray(json, t);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;

    }

    /**
     * Convert JSON data to a more complicated List<Map<K, V>>
     * @param json JSON data
     * @return List<Map<K, V>> list
     */
    public static  <K, V>  List<Map <K, V> > jsonToListMap(String json,Class<K> keyType, Class<V> valueType) {
        if(null != json&&null != keyType&&null != valueType) {
            try{
                return JSON.parseObject(json, new TypeReference<List<Map<K,V>>>(keyType, valueType) {});
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    /**
     *  Use the SerializerFeature feature in JSON to format dates
     * @param date
     * @return string format
     */
    public static String dateToString(Date date) {
        if(null != date) {
            try{
                return JSON.toJSONString(date, SerializerFeature.WriteDateUseDateFormat);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    /**
     * Output format of custom date in JSON
     * @param date  date
     * @param type dateType eg：yyyy-MM-dd
     * @return
     */
    public static String dateToString(Date date,String type) {
        if(null != date) {
            try{
                return JSON.toJSONStringWithDateFormat(date,type);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }
}
