package com.example.jiaowumanager.entity;

public class Course {
    private Long id;
    private String name;
    private Integer credit;

    private Long courseTaskId;   // teacher.id
    private Long courseAssignId; // classgroup.id

    private String teacherName;
    private String teacherJobNo;

    private String classgroupName;
    private String classgroupCode;

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public Integer getCredit() { return credit; }
    public void setCredit(Integer credit) { this.credit = credit; }

    public Long getCourseTaskId() { return courseTaskId; }
    public void setCourseTaskId(Long courseTaskId) { this.courseTaskId = courseTaskId; }

    public Long getCourseAssignId() { return courseAssignId; }
    public void setCourseAssignId(Long courseAssignId) { this.courseAssignId = courseAssignId; }

    public String getTeacherName() { return teacherName; }
    public void setTeacherName(String teacherName) { this.teacherName = teacherName; }

    public String getTeacherJobNo() { return teacherJobNo; }
    public void setTeacherJobNo(String teacherJobNo) { this.teacherJobNo = teacherJobNo; }

    public String getClassgroupName() { return classgroupName; }
    public void setClassgroupName(String classgroupName) { this.classgroupName = classgroupName; }

    public String getClassgroupCode() { return classgroupCode; }
    public void setClassgroupCode(String classgroupCode) { this.classgroupCode = classgroupCode; }
}
