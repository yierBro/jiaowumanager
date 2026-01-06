package com.example.jiaowumanager.mapper;

import com.example.jiaowumanager.entity.College;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CollegeMapper {
    College selectById(@Param("id") Long id);
    List<College> selectAll();
    int insert(College college);
    int update(College college);
    int deleteById(@Param("id") Long id);
}
