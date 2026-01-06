package com.example.jiaowumanager.controller;

import com.example.jiaowumanager.entity.Teacher;
import com.example.jiaowumanager.service.CollegeService;
import com.example.jiaowumanager.service.TeacherService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/teacher")
public class TeacherController {

    private final TeacherService teacherService;
    private final CollegeService collegeService;

    public TeacherController(TeacherService teacherService, CollegeService collegeService) {
        this.teacherService = teacherService;
        this.collegeService = collegeService;
    }

    @GetMapping("/list")
    public String list(Model model) {
        model.addAttribute("list", teacherService.list());
        return "teacher/list";
    }

    @GetMapping("/add")
    public String addForm(Model model) {
        model.addAttribute("teacher", new Teacher());
        model.addAttribute("colleges", collegeService.list());
        return "teacher/form";
    }

    @PostMapping("/add")
    public String add(@ModelAttribute Teacher teacher) {
        teacherService.create(teacher);
        return "redirect:/teacher/list";
    }

    @GetMapping("/edit")
    public String editForm(@RequestParam("id") Long id, Model model) {
        model.addAttribute("teacher", teacherService.get(id));
        model.addAttribute("colleges", collegeService.list());
        return "teacher/form";
    }

    @PostMapping("/edit")
    public String edit(@ModelAttribute Teacher teacher) {
        teacherService.update(teacher);
        return "redirect:/teacher/list";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id) {
        teacherService.delete(id);
        return "redirect:/teacher/list";
    }
}
