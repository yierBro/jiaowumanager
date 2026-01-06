package com.example.jiaowumanager;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class JiaoWuManagerApplication extends SpringBootServletInitializer {

  public static void main(String[] args) {
    SpringApplication.run(JiaoWuManagerApplication.class, args);
  }

  @Override
  protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
    return builder.sources(JiaoWuManagerApplication.class);
  }
}
