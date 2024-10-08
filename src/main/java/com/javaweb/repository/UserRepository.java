package com.javaweb.repository;

import com.javaweb.entity.UserEntity;
import com.javaweb.repository.custom.UserRepositoryCustom;
import com.javaweb.repository.entity.BuildingEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Map;

public interface UserRepository extends JpaRepository<UserEntity, Long> , UserRepositoryCustom {
    UserEntity findOneByUserNameAndStatus(String name, int status);
    Page<UserEntity> findByUserNameContainingIgnoreCaseOrFullNameContainingIgnoreCaseAndStatusNot(String userName, String fullName, int status,
                                                                                                  Pageable pageable);
    List<UserEntity> findByStatusAndRoles_Code(Integer status, String roleCode);
    Page<UserEntity> findByStatusNot(int status, Pageable pageable);
    long countByUserNameContainingIgnoreCaseOrFullNameContainingIgnoreCaseAndStatusNot(String userName, String fullName, int status);
    long countByStatusNot(int status);
    UserEntity findOneByUserName(String userName);
    List<UserEntity> findByIdIn(List<Long> id);

    @Modifying
    @Query(value = "DELETE FROM assignmentbuilding  WHERE buildingid IN :id", nativeQuery = true)
    void deleteAllByAssignmentBuildingIdIn(List<Long> id);

    @Modifying
    @Query(value = "DELETE FROM assignmentbuilding WHERE buildingid = :id", nativeQuery = true)
    void deleteAllByAssignmentBuilding(Long id);

}
