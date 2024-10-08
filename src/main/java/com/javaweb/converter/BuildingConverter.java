package com.javaweb.converter;


import com.javaweb.enums.district;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.repository.entity.BuildingEntity;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.stream.Collectors;

@Configuration
public class BuildingConverter {

    @Autowired
    private ModelMapper modelMapper;

    public ArrayList<BuildingSearchResponse> convert(ArrayList<BuildingEntity> buildingEntityList) {
        ArrayList<BuildingSearchResponse> res = new ArrayList<>();
        for (BuildingEntity i : buildingEntityList) {
            BuildingSearchResponse dto = modelMapper.map(i, BuildingSearchResponse.class);
            dto.setAddress(i.getStreet() +
                    ", " +
                    i.getWard() + ", " +
                    (!i.getDistrict().isEmpty() ?  district.valueOf(i.getDistrict()).getDistrictName() : ""));
            dto.setRentArea(i.getRentAreaEntities().stream()
                    .map(it -> it.getValue().toString())
                    .collect(Collectors.joining(",")));
            res.add(dto);
        }
        return res;
    }

}
