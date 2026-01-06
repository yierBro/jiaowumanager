package com.example.jiaowumanager.controller;

import com.example.jiaowumanager.entity.College;
import com.example.jiaowumanager.service.CollegeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/college")
public class CollegeController {

    private final CollegeService collegeService;

    public CollegeController(CollegeService collegeService) {
        this.collegeService = collegeService;
    }

    @GetMapping("/list")
    public String list(Model model) {
        model.addAttribute("list", collegeService.list());
        return "college/list";
    }

    @GetMapping("/add")
    public String addForm(Model model) {
        model.addAttribute("college", new College());
        return "college/form";
    }

    @PostMapping("/add")
    public String add(@ModelAttribute College college) {
        collegeService.create(college);
        return "redirect:/college/list";
    }

    @GetMapping("/edit")
    public String editForm(@RequestParam("id") Long id, Model model) {
        model.addAttribute("college", collegeService.get(id));
        return "college/form";
    }

    @PostMapping("/edit")
    public String edit(@ModelAttribute College college) {
        collegeService.update(college);
        return "redirect:/college/list";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id) {
        collegeService.delete(id);
        return "redirect:/college/list";
    }
}
