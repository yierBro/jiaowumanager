package com.example.jiaowumanager.service;

import com.example.jiaowumanager.entity.ClassGroup;

import java.util.List;

public interface ClassGroupService {
    List<ClassGroup> list();
    List<ClassGroup> listDropdown();
    ClassGroup get(Long id);
    void create(ClassGroup classGroup);
    void update(ClassGroup classGroup);
    void delete(Long id);
}
