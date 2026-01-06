package com.example.jiaowumanager.service.impl;

import com.example.jiaowumanager.entity.Teacher;
import com.example.jiaowumanager.mapper.TeacherMapper;
import com.example.jiaowumanager.service.TeacherService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class TeacherServiceImpl implements TeacherService {

    private final TeacherMapper teacherMapper;

    public TeacherServiceImpl(TeacherMapper teacherMapper) {
        this.teacherMapper = teacherMapper;
    }

    @Override
    public List<Teacher> list() {
        return teacherMapper.selectAllWithCollege();
    }

    @Override
    public List<Teacher> listDropdown() {
        return teacherMapper.selectAll();
    }

    @Override
    public Teacher get(Long id) {
        return teacherMapper.selectById(id);
    }

    @Override
    @Transactional
    public void create(Teacher teacher) {
        teacherMapper.insert(teacher);
    }

    @Override
    @Transactional
    public void update(Teacher teacher) {
        teacherMapper.update(teacher);
    }

    @Override
    @Transactional
    public void delete(Long id) {
        teacherMapper.deleteById(id);
    }
}
