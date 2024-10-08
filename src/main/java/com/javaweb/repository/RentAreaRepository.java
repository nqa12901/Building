package com.javaweb.repository;

import com.javaweb.repository.entity.BuildingEntity;
import com.javaweb.repository.entity.RentAreaEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.ArrayList;
import java.util.List;

public interface RentAreaRepository extends JpaRepository<RentAreaEntity, Long> {
    ArrayList<RentAreaEntity> findByValueAndBuilding(Long i, BuildingEntity bd);
    void deleteAllByBuildingIdIn(ArrayList<Long> id);
    void deleteAllByBuildingIdInAndValueNotIn(Long id, List<Long> value);
    void deleteAllByBuilding(BuildingEntity buildingEntity);
    ArrayList<RentAreaEntity> findAllByBuildingId(Long id);
}
