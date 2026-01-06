package com.example.jiaowumanager.mapper;

import com.example.jiaowumanager.entity.Course;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CourseMapper {
    Course selectById(@Param("id") Long id);
    List<Course> selectAllWithJoin();
    int insert(Course course);
    int update(Course course);
    int deleteById(@Param("id") Long id);
}
