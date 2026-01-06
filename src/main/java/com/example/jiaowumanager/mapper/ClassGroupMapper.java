package com.example.jiaowumanager.mapper;

import com.example.jiaowumanager.entity.ClassGroup;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ClassGroupMapper {
    ClassGroup selectById(@Param("id") Long id);
    List<ClassGroup> selectAllWithJoin();
    List<ClassGroup> selectAll(); // dropdown for course assign
    int insert(ClassGroup classGroup);
    int update(ClassGroup classGroup);
    int deleteById(@Param("id") Long id);
}
