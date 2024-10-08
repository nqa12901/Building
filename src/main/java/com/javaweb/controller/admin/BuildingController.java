package com.javaweb.controller.admin;

import com.javaweb.constant.SystemConstant;
import com.javaweb.enums.district;
import com.javaweb.enums.rentType;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.service.BuildingService;
import com.javaweb.service.IUserService;
import com.javaweb.utils.DisplayTagUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@RestController(value = "buildingControllerOfAdmin")
public class BuildingController {
    @Autowired
    private IUserService iUserService;

    @Autowired
    private BuildingService buildingService;

    @GetMapping(value = "/admin/building-list")
    public ModelAndView buildingList(@ModelAttribute(name = "modelSearch") BuildingSearchRequest buildingSearchRequest,
                                     @ModelAttribute(SystemConstant.MODEL) BuildingSearchResponse model,
                                     HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView("admin/building/list");
        DisplayTagUtils.of(request, buildingSearchRequest);
        modelAndView.addObject("staffs", iUserService.getStaffs());
        modelAndView.addObject("districtCode", district.districtCode());
        modelAndView.addObject("rentType", rentType.rentTypeName());
        List<BuildingSearchResponse> responseList = buildingService.findAll(buildingSearchRequest, PageRequest.of(buildingSearchRequest.getPage() - 1, buildingSearchRequest.getMaxPageItems()));
        model.setListResult(responseList);
        model.setTotalItems(buildingService.countTotalItems(buildingSearchRequest));
        modelAndView.addObject(SystemConstant.MODEL, model);
        return modelAndView;
    }

    @GetMapping(value = "/admin/building-edit")
    public ModelAndView editBuilding(@ModelAttribute(name = "building") BuildingDTO buildingDTO) {
        ModelAndView modelAndView = new ModelAndView("admin/building/edit");
        modelAndView.addObject("districtCode", district.districtCode());
        modelAndView.addObject("rentType", rentType.rentTypeName());
        return modelAndView;
    }

    @GetMapping(value = "/admin/building-edit-{id}")
    public ModelAndView editOneBuilding(@PathVariable Long id) {
        // Co loi, vi trong view dang su dung BuildingDTO
        // findById => BuildingEntity
        // convert tu BuildingEntity => BuildingDTO
        ModelAndView modelAndView = new ModelAndView("admin/building/edit");
        modelAndView.addObject("districtCode", district.districtCode());
        modelAndView.addObject("rentType", rentType.rentTypeName());
        BuildingDTO buildingDTO = buildingService.findById(id);
        if (buildingDTO == null) {
            modelAndView = new ModelAndView("redirect:/admin/building-list");
        } else modelAndView.addObject("building", buildingDTO);
        return modelAndView;
    }
}
