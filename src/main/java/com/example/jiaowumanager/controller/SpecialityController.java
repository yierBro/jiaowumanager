package com.example.jiaowumanager.controller;

import com.example.jiaowumanager.entity.Speciality;
import com.example.jiaowumanager.service.CollegeService;
import com.example.jiaowumanager.service.SpecialityService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/speciality")
public class SpecialityController {

    private final SpecialityService specialityService;
    private final CollegeService collegeService;

    public SpecialityController(SpecialityService specialityService, CollegeService collegeService) {
        this.specialityService = specialityService;
        this.collegeService = collegeService;
    }

    @GetMapping("/list")
    public String list(Model model) {
        model.addAttribute("list", specialityService.list());
        return "speciality/list";
    }

    @GetMapping("/add")
    public String addForm(Model model) {
        model.addAttribute("speciality", new Speciality());
        model.addAttribute("colleges", collegeService.list());
        return "speciality/form";
    }

    @PostMapping("/add")
    public String add(@ModelAttribute Speciality speciality) {
        specialityService.create(speciality);
        return "redirect:/speciality/list";
    }

    @GetMapping("/edit")
    public String editForm(@RequestParam("id") Long id, Model model) {
        model.addAttribute("speciality", specialityService.get(id));
        model.addAttribute("colleges", collegeService.list());
        return "speciality/form";
    }

    @PostMapping("/edit")
    public String edit(@ModelAttribute Speciality speciality) {
        specialityService.update(speciality);
        return "redirect:/speciality/list";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id) {
        specialityService.delete(id);
        return "redirect:/speciality/list";
    }
}
