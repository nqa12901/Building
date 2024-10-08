package com.javaweb.enums;

import java.util.LinkedHashMap;
import java.util.Map;

public enum rentType {
    TANG_TRET("Tầng trệt"),
    NGUYEN_CAN("Nguyên căn"),
    NOI_THAT("Nội thất");
    private final String name;
    rentType(String name) {
        this.name = name;
    }
    public String getName() {
        return name;
    }
    public static Map<String, String> rentTypeName() {
        Map<String, String> rentTypeName = new LinkedHashMap<>();
        for (rentType type : rentType.values()) {
            rentTypeName.put(type.toString(), type.getName());
        }
        return rentTypeName;
    }
}
