package com.javaweb.utils;

import java.util.Map;

public class BuildingSearchUtils {
    // Hàm lấy ra object từ map dựa theo key và dữ liệu trả về
    public static<T> T getObject(Object obj, Class<T> tClass)
    {
        if (obj != null)
        {
            if (tClass.getTypeName().equals("java.lang.Long"))
            {
                obj = obj != "" ? obj : null;
            }
            else if (tClass.getTypeName().equals("java.lang.String"))
            {
                obj = obj != "" ? obj.toString() : null;
            }
            // Cast object thanh interface hoac class dai dien boi Class do
            return tClass.cast(obj);
        }
        return null;
    }
}
