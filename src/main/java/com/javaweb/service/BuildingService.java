package com.javaweb.service;


import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.entity.BuildingEntity;
import org.springframework.data.domain.Pageable;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public interface BuildingService {
    ArrayList<BuildingSearchResponse> findAll(BuildingSearchRequest request, Pageable pageable);
    int countTotalItems(BuildingSearchRequest request);
    ResponseDTO createAndUpdateBuilding(BuildingDTO requestDTO);
    ResponseDTO deleteBuildings(ArrayList<Long> ids);
    BuildingDTO findById(Long id);
    ResponseDTO getStaffs(Long id);
    ResponseDTO assignStaffs(AssignmentBuildingDTO assignmentBuildingDTO);
}
