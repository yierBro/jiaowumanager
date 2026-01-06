package com.example.jiaowumanager.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@MapperScan("com.example.jiaowumanager.mapper")
public class MyBatisConfig {
}
