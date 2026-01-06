package com.example.jiaowumanager.service;

import com.example.jiaowumanager.entity.Course;

import java.util.List;

public interface CourseService {
    List<Course> list();
    Course get(Long id);
    void create(Course course);
    void update(Course course);
    void delete(Long id);
}
