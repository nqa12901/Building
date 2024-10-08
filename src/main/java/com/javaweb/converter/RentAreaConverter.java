package com.javaweb.converter;

import com.javaweb.repository.entity.RentAreaEntity;
import org.springframework.context.annotation.Configuration;

import java.util.*;
import java.util.stream.Collectors;

@Configuration
public class RentAreaConverter {
    // Co the test de kiem tra du lieu nhap vao co dung khong
    // Rent area nhan ve la chuoi ngan cach boi dau phay, phai tach ra thanh mang
    public Set<Long> stringToList(String rentArea) {
        if (rentArea != null && !rentArea.isEmpty()) {
            return Arrays.stream(rentArea.split(",")).map(it -> Long.valueOf(it.trim())).collect(Collectors.toSet());
        }
        return null;
    }

    public String listToString(ArrayList<RentAreaEntity> rentAreas) {
        if (rentAreas != null && !rentAreas.isEmpty()) {
            return rentAreas.stream().map(it -> it.getValue().toString()).collect(Collectors.joining(","));
        }
        return null;
    }
}
