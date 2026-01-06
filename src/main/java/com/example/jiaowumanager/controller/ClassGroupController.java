package com.example.jiaowumanager.controller;

import com.example.jiaowumanager.entity.ClassGroup;
import com.example.jiaowumanager.service.ClassGroupService;
import com.example.jiaowumanager.service.SpecialityService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/classgroup")
public class ClassGroupController {

    private final ClassGroupService classGroupService;
    private final SpecialityService specialityService;

    public ClassGroupController(ClassGroupService classGroupService, SpecialityService specialityService) {
        this.classGroupService = classGroupService;
        this.specialityService = specialityService;
    }

    @GetMapping("/list")
    public String list(Model model) {
        model.addAttribute("list", classGroupService.list());
        return "classgroup/list";
    }

    @GetMapping("/add")
    public String addForm(Model model) {
        model.addAttribute("classgroup", new ClassGroup());
        model.addAttribute("specialities", specialityService.listDropdown());
        return "classgroup/form";
    }

    @PostMapping("/add")
    public String add(@ModelAttribute ClassGroup classGroup) {
        classGroupService.create(classGroup);
        return "redirect:/classgroup/list";
    }

    @GetMapping("/edit")
    public String editForm(@RequestParam("id") Long id, Model model) {
        model.addAttribute("classgroup", classGroupService.get(id));
        model.addAttribute("specialities", specialityService.listDropdown());
        return "classgroup/form";
    }

    @PostMapping("/edit")
    public String edit(@ModelAttribute ClassGroup classGroup) {
        classGroupService.update(classGroup);
        return "redirect:/classgroup/list";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id) {
        classGroupService.delete(id);
        return "redirect:/classgroup/list";
    }
}
