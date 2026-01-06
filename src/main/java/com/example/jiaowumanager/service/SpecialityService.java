package com.example.jiaowumanager.service;

import com.example.jiaowumanager.entity.Speciality;

import java.util.List;

public interface SpecialityService {
    List<Speciality> list();
    List<Speciality> listDropdown();
    Speciality get(Long id);
    void create(Speciality speciality);
    void update(Speciality speciality);
    void delete(Long id);
}
