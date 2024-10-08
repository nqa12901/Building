package com.javaweb.api.admin;

import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.BuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.transaction.Transactional;
import java.util.ArrayList;

@RestController
@Transactional
@RequestMapping("/api/buildings")
public class BuildingAPI {
    @Autowired
    private BuildingService buildingService;

    @GetMapping(value = "/{id}/staffs")
    public ResponseDTO getAllStaffs(@PathVariable Long id) {
        ResponseDTO responseDTO = buildingService.getStaffs(id);
        return responseDTO;
    }

    @PostMapping
    public ResponseDTO createBuilding(@RequestBody BuildingDTO dto) {
        ResponseDTO responseDTO = buildingService.createAndUpdateBuilding(dto);
        return responseDTO;
    }

    @DeleteMapping(value = "/{ids}")
    public ResponseDTO deleteBuilding(@PathVariable ArrayList<Long> ids) {
        ResponseDTO responseDTO = buildingService.deleteBuildings(ids);
        return responseDTO;
    }

    @PostMapping(value = "/staffs")
    public ResponseDTO assignStaffs(@RequestBody AssignmentBuildingDTO dto)
    {
        ResponseDTO responseDTO = buildingService.assignStaffs(dto);
        return responseDTO;
    }
}
