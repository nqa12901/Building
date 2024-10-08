//package com.javaweb.repository.entity;
//
//import com.javaweb.entity.UserEntity;
//import lombok.Getter;
//import lombok.Setter;
//
//import javax.persistence.*;
//
//@Getter
//@Setter
//@Entity
//@Table(name = "assignmentbuilding")
//public class AssignmentBuildingEntity {
//    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    private Long id;
//
//    @ManyToOne
//    @JoinColumn(name = "staffid")
//    private UserEntity staff;
//
//    @ManyToOne
//    @JoinColumn(name = "buildingid")
//    private BuildingEntity buildingAssigment;
//
//
//
//    public AssignmentBuildingEntity() {
//    }
//}
