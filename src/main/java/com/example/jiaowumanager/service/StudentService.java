package com.example.jiaowumanager.service;

import com.example.jiaowumanager.entity.Student;

import java.util.List;

public interface StudentService {
    List<Student> list();
    Student get(Long id);
    void create(Student student);
    void update(Student student);
    void delete(Long id);
}
