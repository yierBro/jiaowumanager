package com.example.jiaowumanager.entity;

public class ClassGroup {
    private Long id;
    private String name;
    private String code;
    private Long specialityId;

    private String specialityName;
    private Long collegeId;
    private String collegeName;

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getCode() { return code; }
    public void setCode(String code) { this.code = code; }

    public Long getSpecialityId() { return specialityId; }
    public void setSpecialityId(Long specialityId) { this.specialityId = specialityId; }

    public String getSpecialityName() { return specialityName; }
    public void setSpecialityName(String specialityName) { this.specialityName = specialityName; }

    public Long getCollegeId() { return collegeId; }
    public void setCollegeId(Long collegeId) { this.collegeId = collegeId; }

    public String getCollegeName() { return collegeName; }
    public void setCollegeName(String collegeName) { this.collegeName = collegeName; }
}
