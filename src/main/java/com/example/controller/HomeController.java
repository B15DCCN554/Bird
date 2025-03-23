package com.example.controller;

import com.example.service.BirdService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class HomeController {
    @Autowired
    private BirdService birdService;

    @GetMapping("/")
    public String homePage(Model model) {
        model.addAttribute("birds", birdService.getAllBirds());
        return "home";
    }

    @GetMapping("/bird/{id}")
    public String birdDetail(@PathVariable Long id, Model model) {
        model.addAttribute("bird", birdService.getBirdById(id));
        return "bird_detail";
    }
}
