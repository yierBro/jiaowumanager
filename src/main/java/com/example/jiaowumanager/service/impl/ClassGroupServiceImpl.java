package com.example.jiaowumanager.service.impl;

import com.example.jiaowumanager.entity.ClassGroup;
import com.example.jiaowumanager.mapper.ClassGroupMapper;
import com.example.jiaowumanager.service.ClassGroupService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ClassGroupServiceImpl implements ClassGroupService {

    private final ClassGroupMapper classGroupMapper;

    public ClassGroupServiceImpl(ClassGroupMapper classGroupMapper) {
        this.classGroupMapper = classGroupMapper;
    }

    @Override
    public List<ClassGroup> list() {
        return classGroupMapper.selectAllWithJoin();
    }

    @Override
    public List<ClassGroup> listDropdown() {
        return classGroupMapper.selectAll();
    }

    @Override
    public ClassGroup get(Long id) {
        return classGroupMapper.selectById(id);
    }

    @Override
    @Transactional
    public void create(ClassGroup classGroup) {
        classGroupMapper.insert(classGroup);
    }

    @Override
    @Transactional
    public void update(ClassGroup classGroup) {
        classGroupMapper.update(classGroup);
    }

    @Override
    @Transactional
    public void delete(Long id) {
        classGroupMapper.deleteById(id);
    }
}
