package com.example.jiaowumanager.controller;

import com.example.jiaowumanager.entity.Student;
import com.example.jiaowumanager.service.ClassGroupService;
import com.example.jiaowumanager.service.StudentService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/student")
public class StudentController {

    private final StudentService studentService;
    private final ClassGroupService classGroupService;

    public StudentController(StudentService studentService, ClassGroupService classGroupService) {
        this.studentService = studentService;
        this.classGroupService = classGroupService;
    }

    @GetMapping("/list")
    public String list(Model model) {
        model.addAttribute("list", studentService.list());
        return "student/list";
    }

    @GetMapping("/add")
    public String addForm(Model model) {
        model.addAttribute("student", new Student());
        model.addAttribute("classgroups", classGroupService.listDropdown());
        return "student/form";
    }

    @PostMapping("/add")
    public String add(@ModelAttribute Student student) {
        studentService.create(student);
        return "redirect:/student/list";
    }

    @GetMapping("/edit")
    public String editForm(@RequestParam("id") Long id, Model model) {
        model.addAttribute("student", studentService.get(id));
        model.addAttribute("classgroups", classGroupService.listDropdown());
        return "student/form";
    }

    @PostMapping("/edit")
    public String edit(@ModelAttribute Student student) {
        studentService.update(student);
        return "redirect:/student/list";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id) {
        studentService.delete(id);
        return "redirect:/student/list";
    }
}
