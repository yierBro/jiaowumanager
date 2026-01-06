package com.example.jiaowumanager.mapper;

import com.example.jiaowumanager.entity.Student;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StudentMapper {
    Student selectById(@Param("id") Long id);
    List<Student> selectAllWithJoin();
    int insert(Student student);
    int update(Student student);
    int deleteById(@Param("id") Long id);
}
