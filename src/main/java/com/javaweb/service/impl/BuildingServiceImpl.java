package com.javaweb.service.impl;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.converter.BuildingConverter;
import com.javaweb.converter.BuildingSearchBuilderConverter;
import com.javaweb.converter.RentAreaConverter;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.repository.entity.BuildingEntity;
import com.javaweb.repository.entity.RentAreaEntity;
import com.javaweb.service.BuildingService;
import com.javaweb.utils.UploadFileUtils;
import org.apache.tomcat.util.codec.binary.Base64;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.File;
import java.util.*;
import java.util.stream.Collectors;


@Service
public class BuildingServiceImpl implements BuildingService {

    @Autowired
    private BuildingSearchBuilderConverter buildingSearchBuilderConverter;

    @Autowired
    private BuildingRepository buildingRepository;

    @Autowired
    private BuildingConverter buildingConverter;

    @Autowired
    private RentAreaConverter rentAreaConverter;

    @Autowired
    private RentAreaRepository rentAreaRepository;

    @Autowired
    private UploadFileUtils uploadFileUtils;
    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    private UserRepository userRepository;


    @Override
    public ArrayList<BuildingSearchResponse> findAll(BuildingSearchRequest request, Pageable pageable) {
        BuildingSearchBuilder builder = buildingSearchBuilderConverter.buildingSearchRequestToBuildingSearchBuilder(request);
        ArrayList<BuildingEntity> buildingEntities = buildingRepository.find(builder, pageable);
        ArrayList<BuildingSearchResponse> buildingSearchResponses = buildingConverter.convert(buildingEntities);
        return buildingSearchResponses;
    }

    @Override
    public int countTotalItems(BuildingSearchRequest request) {
        BuildingSearchBuilder builder = buildingSearchBuilderConverter.buildingSearchRequestToBuildingSearchBuilder(request);
        int totalItems = buildingRepository.countTotalItem(builder);
        return totalItems;
    }

    @Override
    public ResponseDTO createAndUpdateBuilding(BuildingDTO buildingDTO) {
        ResponseDTO responseDTO = new ResponseDTO();
        BuildingEntity buildingEntity = modelMapper.map(buildingDTO, BuildingEntity.class);
        // Chuyen doi Type tu list ve String de luu trong database
        String type = "";
        if (buildingDTO.getType() != null) {
            type = String.join(",", buildingDTO.getType());
        }
        buildingEntity.setType(type);
        if (buildingDTO.getImageName() != null){
            saveThumbnail(buildingDTO, buildingEntity);
        }
        else {
            buildingEntity.setImage(buildingRepository.findById(buildingDTO.getId()).get().getImage());
        }
        Set<Long> rentArea = rentAreaConverter.stringToList(buildingDTO.getRentArea());
        List<RentAreaEntity> rentAreaEntities = new ArrayList<>();

        if (rentArea != null)
        {
            for (Long i : rentArea) {
                RentAreaEntity rentAreaEntity = new RentAreaEntity();
                rentAreaEntity.setBuildingEntity(buildingEntity);
                rentAreaEntity.setValue(i);
                rentAreaEntities.add(rentAreaEntity);
            }
        }
        buildingEntity.setRentAreaEntities(rentAreaEntities);
        if (buildingDTO.getId() != null){
            buildingEntity.setStaffList(buildingRepository.findById(buildingDTO.getId()).get().getStaffList());
        }
        buildingRepository.save(buildingEntity);

        if (buildingDTO.getId() != null) {
            responseDTO.setMessage("Building updated");
        } else {
            responseDTO.setMessage("Building created");
        }
        return responseDTO;
    }

    private void saveThumbnail(BuildingDTO buildingDTO, BuildingEntity buildingEntity) {
        String path = "/building/" + buildingDTO.getImageName();
        if (null != buildingDTO.getImageBase64()) {
            if (null != buildingEntity.getImage()) {
                if (!path.equals(buildingEntity.getImage())) {
                    File file = new File("C://home/office" + buildingEntity.getImage());
                    file.delete();
                }
            }
            byte[] bytes = Base64.decodeBase64(buildingDTO.getImageBase64().getBytes());
            uploadFileUtils.writeOrUpdate(path, bytes);
            buildingEntity.setImage(path);
        }
    }


    @Override
    public ResponseDTO deleteBuildings(ArrayList<Long> ids) {
        ResponseDTO responseDTO = new ResponseDTO();
        buildingRepository.deleteByIdIn(ids);
        if (ids.size() == 1)
            responseDTO.setMessage("Building deleted");
        else responseDTO.setMessage("Selected buildings deleted");
        return responseDTO;
    }

    @Override
    public BuildingDTO findById(Long id) {
        BuildingEntity bd = buildingRepository.findById(id).get();
        BuildingDTO dto = modelMapper.map(bd, BuildingDTO.class);
        String rentArea = "";
        ArrayList<RentAreaEntity> rentAreas = rentAreaRepository.findAllByBuildingId(id);
        rentArea = rentAreaConverter.listToString(rentAreas);
        if (bd.getType() != null && !bd.getType().isEmpty()) {
            dto.setType(Arrays.asList(bd.getType().split(",")));
        }
        dto.setRentArea(rentArea);
        return dto;
    }

    @Override
    public ResponseDTO getStaffs(Long id) {
        // Get tat ca nhan vien
        List<UserEntity> staffs = userRepository.findByStatusAndRoles_Code(1, "STAFF");
        // Get danh sach nhan vien dang quan ly toa nha
        List<UserEntity> staffAssignmentBuilding = buildingRepository.findById(id).get().getStaffList();
        List<StaffResponseDTO> staffResponse = new ArrayList<>();
        for (UserEntity staff : staffs) {
            StaffResponseDTO staffResponseDTO = new StaffResponseDTO();
            staffResponseDTO.setStaffId(staff.getId());
            staffResponseDTO.setFullName(staff.getFullName());
            if (staffAssignmentBuilding.contains(staff)) {
                staffResponseDTO.setChecked("checked");
            } else {
                staffResponseDTO.setChecked("");
            }
            staffResponse.add(staffResponseDTO);
        }
        ResponseDTO responseDTO = new ResponseDTO();
        responseDTO.setData(staffResponse);
        return responseDTO;
    }

    @Override
    public ResponseDTO assignStaffs(AssignmentBuildingDTO assignmentBuildingDTO) {
        ResponseDTO responseDTO = new ResponseDTO();
        BuildingEntity buildingEntity = buildingRepository.findById(assignmentBuildingDTO.getBuildingId()).get();
        userRepository.deleteAllByAssignmentBuilding(assignmentBuildingDTO.getBuildingId());
        if (!assignmentBuildingDTO.getStaffs().isEmpty()) {
            List<UserEntity> staffList = new ArrayList<>();
            for (Long id : assignmentBuildingDTO.getStaffs()) {
                UserEntity userEntity = userRepository.findById(id).get();
                userEntity.getAssignmentBuilding().add(buildingEntity);
                staffList.add(userEntity);
            }
            buildingEntity.setStaffList(staffList);
            buildingRepository.save(buildingEntity);
            responseDTO.setMessage("Assigned staffs");
        } else {
            responseDTO.setMessage("Unassigned all staffs");
        }
        return responseDTO;
    }
}
