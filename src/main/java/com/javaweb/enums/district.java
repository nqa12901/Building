package com.javaweb.enums;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

public enum district {
    QUAN_1("Quận 1"),
    QUAN_2("Quận 2"),
    QUAN_3("Quận 3"),
    QUAN_4("Quận 4"),
    QUAN_BD("Quận Bà Đình"),
    QUAN_CG("Quận Cầu Giấy"),
    QUAN_HBT("Quận Hai Bà Trưng");

    private final String districtName;
    district(String districtName) {
        this.districtName = districtName;
    }

    public String getDistrictName() {
        return districtName;
    }

    public static Map<String, String> districtCode() {
        Map<String, String> districtCode = new LinkedHashMap<>();
        for (district district : district.values()) {
            districtCode.put(district.toString(), district.getDistrictName());
        }
        return districtCode;
    }
}
