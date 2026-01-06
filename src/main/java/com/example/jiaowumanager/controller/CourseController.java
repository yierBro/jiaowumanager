package com.example.jiaowumanager.controller;

import com.example.jiaowumanager.entity.Course;
import com.example.jiaowumanager.service.ClassGroupService;
import com.example.jiaowumanager.service.CourseService;
import com.example.jiaowumanager.service.TeacherService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/course")
public class CourseController {

    private final CourseService courseService;
    private final TeacherService teacherService;
    private final ClassGroupService classGroupService;

    public CourseController(CourseService courseService, TeacherService teacherService, ClassGroupService classGroupService) {
        this.courseService = courseService;
        this.teacherService = teacherService;
        this.classGroupService = classGroupService;
    }

    @GetMapping("/list")
    public String list(Model model) {
        model.addAttribute("list", courseService.list());
        return "course/list";
    }

    @GetMapping("/add")
    public String addForm(Model model) {
        model.addAttribute("course", new Course());
        // 新增课程：从 teacher 表选老师（course_task_id）
        model.addAttribute("teachers", teacherService.listDropdown());
        // 新增课程：从 classgroup 表选班级（course_assign_id）
        model.addAttribute("classgroups", classGroupService.listDropdown());
        return "course/form";
    }

    @PostMapping("/add")
    public String add(@ModelAttribute Course course) {
        courseService.create(course);
        return "redirect:/course/list";
    }

    @GetMapping("/edit")
    public String editForm(@RequestParam("id") Long id, Model model) {
        model.addAttribute("course", courseService.get(id));
        model.addAttribute("teachers", teacherService.listDropdown());
        model.addAttribute("classgroups", classGroupService.listDropdown());
        return "course/form";
    }

    @PostMapping("/edit")
    public String edit(@ModelAttribute Course course) {
        courseService.update(course);
        return "redirect:/course/list";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id) {
        courseService.delete(id);
        return "redirect:/course/list";
    }
}
