package com.example.jiaowumanager.service.impl;

import com.example.jiaowumanager.entity.Student;
import com.example.jiaowumanager.mapper.StudentMapper;
import com.example.jiaowumanager.service.StudentService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {

    private final StudentMapper studentMapper;

    public StudentServiceImpl(StudentMapper studentMapper) {
        this.studentMapper = studentMapper;
    }

    @Override
    public List<Student> list() {
        return studentMapper.selectAllWithJoin();
    }

    @Override
    public Student get(Long id) {
        return studentMapper.selectById(id);
    }

    @Override
    @Transactional
    public void create(Student student) {
        studentMapper.insert(student);
    }

    @Override
    @Transactional
    public void update(Student student) {
        studentMapper.update(student);
    }

    @Override
    @Transactional
    public void delete(Long id) {
        studentMapper.deleteById(id);
    }
}
