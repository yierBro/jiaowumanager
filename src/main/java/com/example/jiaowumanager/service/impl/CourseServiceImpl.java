package com.example.jiaowumanager.service.impl;

import com.example.jiaowumanager.entity.Course;
import com.example.jiaowumanager.mapper.CourseMapper;
import com.example.jiaowumanager.service.CourseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CourseServiceImpl implements CourseService {

    private final CourseMapper courseMapper;

    public CourseServiceImpl(CourseMapper courseMapper) {
        this.courseMapper = courseMapper;
    }

    @Override
    public List<Course> list() {
        return courseMapper.selectAllWithJoin();
    }

    @Override
    public Course get(Long id) {
        return courseMapper.selectById(id);
    }

    @Override
    @Transactional
    public void create(Course course) {
        courseMapper.insert(course);
    }

    @Override
    @Transactional
    public void update(Course course) {
        courseMapper.update(course);
    }

    @Override
    @Transactional
    public void delete(Long id) {
        courseMapper.deleteById(id);
    }
}
