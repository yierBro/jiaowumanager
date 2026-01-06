package com.example.jiaowumanager.service;

import com.example.jiaowumanager.entity.Teacher;

import java.util.List;

public interface TeacherService {
    List<Teacher> list();
    List<Teacher> listDropdown();
    Teacher get(Long id);
    void create(Teacher teacher);
    void update(Teacher teacher);
    void delete(Long id);
}
