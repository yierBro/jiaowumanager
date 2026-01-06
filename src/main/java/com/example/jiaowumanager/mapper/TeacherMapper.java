package com.example.jiaowumanager.mapper;

import com.example.jiaowumanager.entity.Teacher;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TeacherMapper {
    Teacher selectById(@Param("id") Long id);
    List<Teacher> selectAllWithCollege();
    List<Teacher> selectAll(); // for dropdown
    int insert(Teacher teacher);
    int update(Teacher teacher);
    int deleteById(@Param("id") Long id);
}
