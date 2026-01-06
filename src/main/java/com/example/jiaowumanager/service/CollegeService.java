package com.example.jiaowumanager.service;

import com.example.jiaowumanager.entity.College;

import java.util.List;

public interface CollegeService {
    List<College> list();
    College get(Long id);
    void create(College college);
    void update(College college);
    void delete(Long id);
}
