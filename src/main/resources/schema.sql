CREATE DATABASE IF NOT EXISTS jiaowumanager DEFAULT CHARSET utf8mb4;
USE jiaowumanager;

CREATE TABLE IF NOT EXISTS college (
                                       id BIGINT PRIMARY KEY AUTO_INCREMENT,
                                       name VARCHAR(100) NOT NULL,
                                       code VARCHAR(50) UNIQUE,
                                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS teacher (
                                       id BIGINT PRIMARY KEY AUTO_INCREMENT,
                                       name VARCHAR(100) NOT NULL,
                                       job_no VARCHAR(50) UNIQUE,
                                       college_id BIGINT NOT NULL,
                                       CONSTRAINT fk_teacher_college FOREIGN KEY (college_id) REFERENCES college(id)
);

CREATE TABLE IF NOT EXISTS speciality (
                                          id BIGINT PRIMARY KEY AUTO_INCREMENT,
                                          name VARCHAR(100) NOT NULL,
                                          code VARCHAR(50) UNIQUE,
                                          college_id BIGINT NOT NULL,
                                          CONSTRAINT fk_speciality_college FOREIGN KEY (college_id) REFERENCES college(id)
);

CREATE TABLE IF NOT EXISTS classgroup (
                                          id BIGINT PRIMARY KEY AUTO_INCREMENT,
                                          name VARCHAR(100) NOT NULL,
                                          code VARCHAR(50) UNIQUE,
                                          speciality_id BIGINT NOT NULL,
                                          CONSTRAINT fk_classgroup_speciality FOREIGN KEY (speciality_id) REFERENCES speciality(id)
);

CREATE TABLE IF NOT EXISTS student (
                                       id BIGINT PRIMARY KEY AUTO_INCREMENT,
                                       name VARCHAR(100) NOT NULL,
                                       student_no VARCHAR(50) UNIQUE,
                                       classgroup_id BIGINT NOT NULL,
                                       CONSTRAINT fk_student_classgroup FOREIGN KEY (classgroup_id) REFERENCES classgroup(id)
);

CREATE TABLE IF NOT EXISTS course (
                                      id BIGINT PRIMARY KEY AUTO_INCREMENT,
                                      name VARCHAR(120) NOT NULL,
                                      credit INT NOT NULL,
                                      course_task_id BIGINT NOT NULL,
                                      course_assign_id BIGINT NOT NULL,
                                      CONSTRAINT fk_course_teacher FOREIGN KEY (course_task_id) REFERENCES teacher(id),
                                      CONSTRAINT fk_course_classgroup FOREIGN KEY (course_assign_id) REFERENCES classgroup(id)
);
