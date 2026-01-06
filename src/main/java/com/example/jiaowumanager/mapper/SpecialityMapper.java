package com.example.jiaowumanager.mapper;

import com.example.jiaowumanager.entity.Speciality;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SpecialityMapper {
    Speciality selectById(@Param("id") Long id);
    List<Speciality> selectAllWithCollege();
    List<Speciality> selectAll(); // dropdown
    int insert(Speciality speciality);
    int update(Speciality speciality);
    int deleteById(@Param("id") Long id);
}
