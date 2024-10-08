package com.javaweb.repository.entity;

import com.javaweb.entity.UserEntity;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.Cascade;

import javax.persistence.*;
import java.util.List;
import java.util.Set;

@Getter
@Setter
@Entity
@Table(name = "building")
public class BuildingEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "name")
    private String name;
    @Column(name = "street")
    private String street;
    @Column(name = "ward")
    private String ward;
    @Column(name = "district")
    private String district;
    @Column(name = "structure")
    private String structure;
    @Column(name = "numberofbasement")
    private Long numberOfBasement;
    @Column(name = "floorarea")
    private Long floorArea;
    @Column(name = "direction")
    private String direction;
    @Column(name = "level")
    private String level;
    @Column(name = "rentprice")
    private Long rentPrice;
    @Column(name = "rentpricedescription")
    private String rentPriceDescription;
    @Column(name = "servicefee")
    private String serviceFee;
    @Column(name = "carfee")
    private String carFee;
    @Column(name = "motofee")
    private String motoFee;
    @Column(name = "overtimefee")
    private String overtimeFee;
    @Column(name = "waterfee")
    private String waterFee;
    @Column(name = "electricityfee")
    private String electricityFee;
    @Column(name = "deposit")
    private String deposit;
    @Column(name = "payment")
    private String payment;
    @Column(name = "renttime")
    private String rentTime;
    @Column(name = "decorationtime")
    private String decorationTime;
    @Column(name = "brokeragefee")
    private Double brokerageFee;
    @Column(name = "type")
    private String type;
    @Column(name = "note")
    private String note;
    @Column(name = "linkofbuilding")
    private String linkOfBuilding;
    @Column(name = "map")
    private String map;
    @Column(name = "avatar")
    private String image;
    @Column(name = "managername")
    private String managerName;
    @Column(name = "managerphone")
    private String managerPhone;


    // Fetch type LAZY: Khong lay het cac doi tuong lien quan, chi lay khi goi ham get => Tang toc khi query voi so luong record lon
    @OneToMany(mappedBy = "building", fetch = FetchType.LAZY, cascade = {CascadeType.MERGE, CascadeType.PERSIST}, orphanRemoval = true)
    private List<RentAreaEntity> rentAreaEntities;

    @ManyToMany
    @JoinTable(
            name = "assignmentbuilding",
            joinColumns = @JoinColumn(name = "buildingid"),
            inverseJoinColumns = @JoinColumn(name = "staffid")
    )
    private List<UserEntity> staffList;
}