package com.javaweb.builder;

import java.util.ArrayList;
import java.util.List;

public class BuildingSearchBuilder {
    private String name;
    private String ward;
    private String managerName;
    private String managerPhone;
    private String street;
    private String direction;
    private Long staffId;
    private Long startRentArea;
    private Long endRentArea;
    private Long startPrice;
    private Long endPrice;
    private Long floorArea;
    private String district;
    private Long numberOfBasement;
    private String level;
    private List<String> type;

    public BuildingSearchBuilder(Builder builder) {
        this.name = builder.name;
        this.ward = builder.ward;
        this.managerName = builder.managerName;
        this.managerPhone = builder.managerPhone;
        this.street = builder.street;
        this.direction = builder.direction;
        this.startRentArea = builder.startRentArea;
        this.endRentArea = builder.endRentArea;
        this.startPrice = builder.startPrice;
        this.endPrice = builder.endPrice;
        this.floorArea = builder.floorArea;
        this.district = builder.district;

        this.numberOfBasement = builder.numberOfBasement;
        this.type = builder.type;
        this.staffId = builder.staffId;
        this.level = builder.level;
    }

    public String getManagerPhone() {
        return managerPhone;
    }

    public String getDirection() {
        return direction;
    }

    public String getLevel() {
        return level;
    }

    public String getName() {
        return name;
    }

    public String getWard() {
        return ward;
    }

    public String getManagerName() {
        return managerName;
    }

    public String getStreet() {
        return street;
    }

    public Long getStartRentArea() {
        return startRentArea;
    }

    public Long getEndRentArea() {
        return endRentArea;
    }

    public Long getStartPrice() {
        return startPrice;
    }

    public Long getEndPrice() {
        return endPrice;
    }

    public Long getFloorArea() {
        return floorArea;
    }

    public String getDistrictId() {
        return district;
    }



    public Long getNumberOfBasement() {
        return numberOfBasement;
    }

    public Long getStaffId() {
        return staffId;
    }

    public List<String> getType() {
        return type;
    }

    public static class Builder {
        private String name;
        private String ward;
        private String managerName;
        private String managerPhone;
        private String direction;
        private String street;
        private Long staffId;
        private Long startRentArea;
        private Long endRentArea;
        private Long startPrice;
        private Long endPrice;
        private Long floorArea;
        private String district;
        private Long numberOfBasement;
        private String level;
        private List<String> type;

        public Builder setLevel(String level) {
            this.level = level;
            return this;
        }

        public Builder setDirection(String direction) {
            this.direction = direction;
            return this;
        }

        public Builder setName(String name) {
            this.name = name;
            return this;
        }

        public Builder setStaffId(Long staffId) {
            this.staffId = staffId;
            return this;
        }

        public Builder setWard(String ward) {
            this.ward = ward;
            return this;
        }

        public Builder setManagerName(String managerName) {
            this.managerName = managerName;
            return this;
        }

        public Builder setManagerPhone(String managerPhone) {
            this.managerPhone = managerPhone;
            return this;
        }

        public Builder setStreet(String street) {
            this.street = street;
            return this;
        }

        public Builder setStartRentArea(Long startRentArea) {
            this.startRentArea = startRentArea;
            return this;
        }

        public Builder setEndRentArea(Long endRentArea) {
            this.endRentArea = endRentArea;
            return this;
        }

        public Builder setStartPrice(Long startPrice) {
            this.startPrice = startPrice;
            return this;
        }

        public Builder setEndPrice(Long endPrice) {
            this.endPrice = endPrice;
            return this;
        }

        public Builder setFloorArea(Long floorArea) {
            this.floorArea = floorArea;
            return this;
        }

        public Builder setDistrict(String district) {
            this.district = district;
            return this;
        }



        public Builder setNumberOfBasement(Long numberOfBasement) {
            this.numberOfBasement = numberOfBasement;
            return this;
        }

        public Builder setType(List<String> type) {
            this.type = type;
            return this;
        }

        public BuildingSearchBuilder build() {
            return new BuildingSearchBuilder(this);
        }
    }
}


