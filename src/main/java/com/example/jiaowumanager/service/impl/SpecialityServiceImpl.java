package com.example.jiaowumanager.service.impl;

import com.example.jiaowumanager.entity.Speciality;
import com.example.jiaowumanager.mapper.SpecialityMapper;
import com.example.jiaowumanager.service.SpecialityService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class SpecialityServiceImpl implements SpecialityService {

    private final SpecialityMapper specialityMapper;

    public SpecialityServiceImpl(SpecialityMapper specialityMapper) {
        this.specialityMapper = specialityMapper;
    }

    @Transactional
    @Override
    public List<Speciality> list() {
        return specialityMapper.selectAllWithCollege();
    }

    @Override
    public List<Speciality> listDropdown() {
        return specialityMapper.selectAll();
    }

    @Override
    public Speciality get(Long id) {
        return specialityMapper.selectById(id);
    }

    @Override
    @Transactional
    public void create(Speciality speciality) {
        specialityMapper.insert(speciality);
    }

    @Override
    @Transactional
    public void update(Speciality speciality) {
        specialityMapper.update(speciality);
    }

    @Override
    @Transactional
    public void delete(Long id) {
        specialityMapper.deleteById(id);
    }
}
