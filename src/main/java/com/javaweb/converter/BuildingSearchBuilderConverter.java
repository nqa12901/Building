package com.javaweb.converter;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.utils.BuildingSearchUtils;
import org.springframework.stereotype.Component;

import java.util.stream.Collectors;

@Component
public class BuildingSearchBuilderConverter {
    public BuildingSearchBuilder buildingSearchRequestToBuildingSearchBuilder(BuildingSearchRequest buildingSearchRequest) {
        BuildingSearchBuilder builder = new BuildingSearchBuilder.Builder()
                .setName(BuildingSearchUtils.getObject(buildingSearchRequest.getName(), String.class))
                .setWard(BuildingSearchUtils.getObject(buildingSearchRequest.getWard(), String.class))
                .setManagerName(BuildingSearchUtils.getObject(buildingSearchRequest.getManagerName(), String.class))
                .setManagerPhone(BuildingSearchUtils.getObject(buildingSearchRequest.getManagerPhone(), String.class))
                .setStreet(BuildingSearchUtils.getObject(buildingSearchRequest.getStreet(), String.class))
                .setDirection(BuildingSearchUtils.getObject(buildingSearchRequest.getDirection(), String.class))
                .setStaffId(BuildingSearchUtils.getObject(buildingSearchRequest.getStaffId(), Long.class))
                .setStartRentArea(BuildingSearchUtils.getObject(buildingSearchRequest.getStartRentArea(), Long.class))
                .setEndRentArea(BuildingSearchUtils.getObject(buildingSearchRequest.getEndRentArea(), Long.class))
                .setStartPrice(BuildingSearchUtils.getObject(buildingSearchRequest.getStartRentPrice(), Long.class))
                .setEndPrice(BuildingSearchUtils.getObject(buildingSearchRequest.getEndRentPrice(), Long.class))
                .setFloorArea(BuildingSearchUtils.getObject(buildingSearchRequest.getFloorArea(), Long.class))
                .setDistrict(BuildingSearchUtils.getObject(buildingSearchRequest.getDistrict(), String.class))
                .setNumberOfBasement(BuildingSearchUtils.getObject(buildingSearchRequest.getNumberOfBasement(), Long.class))
                .setLevel(BuildingSearchUtils.getObject(buildingSearchRequest.getLevel(), String.class))
                .setType(buildingSearchRequest.getType())
                .build();

        return builder;
    }
}
