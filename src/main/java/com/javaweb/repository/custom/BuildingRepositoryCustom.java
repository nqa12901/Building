package com.javaweb.repository.custom;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.repository.entity.BuildingEntity;
import org.springframework.data.domain.Pageable;

import java.util.ArrayList;

public interface BuildingRepositoryCustom {
    ArrayList<BuildingEntity> find(BuildingSearchBuilder builder, Pageable pageable);
    int countTotalItem(BuildingSearchBuilder builder);
}
