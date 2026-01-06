package com.example.jiaowumanager.service.impl;

import com.example.jiaowumanager.entity.College;
import com.example.jiaowumanager.mapper.CollegeMapper;
import com.example.jiaowumanager.service.CollegeService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CollegeServiceImpl implements CollegeService {

    private final CollegeMapper collegeMapper;

    public CollegeServiceImpl(CollegeMapper collegeMapper) {
        this.collegeMapper = collegeMapper;
    }

    @Override
    public List<College> list() {
        return collegeMapper.selectAll();
    }

    @Override
    public College get(Long id) {
        return collegeMapper.selectById(id);
    }

    @Override
    @Transactional
    public void create(College college) {
        collegeMapper.insert(college);
    }

    @Override
    @Transactional
    public void update(College college) {
        collegeMapper.update(college);
    }

    @Override
    @Transactional
    public void delete(Long id) {
        collegeMapper.deleteById(id);
    }
}
