package com.example.controller;

import com.example.model.Bird;
import com.example.service.BirdService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.File;
import java.io.IOException;
import java.nio.file.*;
import org.springframework.web.multipart.MultipartFile;


@Controller
@RequestMapping("/birds")
public class BirdController {
    @Autowired
    private BirdService birdService;
    private static final String UPLOAD_DIR = "uploads/"; // Thư mục lưu ảnh

    @GetMapping
    public String listBirds(Model model) {
        model.addAttribute("birds", birdService.getAllBirds());
        model.addAttribute("bird", new Bird());
        return "birds";
    }

    @PostMapping("/add")
    public String addBird(@ModelAttribute Bird bird, @RequestParam("image") MultipartFile imageFile) {
        if (!imageFile.isEmpty()) {
            try {
                // Tạo thư mục nếu chưa có
                File uploadDir = new File(UPLOAD_DIR);
                if (!uploadDir.exists()) uploadDir.mkdirs();

                // Lưu ảnh vào thư mục uploads/
                String fileName = System.currentTimeMillis() + "_" + imageFile.getOriginalFilename();
                Path filePath = Paths.get(UPLOAD_DIR + fileName);
                Files.write(filePath, imageFile.getBytes());

                bird.setImageUrl(fileName);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        birdService.saveBird(bird);
        return "redirect:/birds";
    }
    @GetMapping("/images/{filename}")
    @ResponseBody
    public byte[] getImage(@PathVariable String filename) throws IOException {
        Path imagePath = Paths.get(UPLOAD_DIR + filename);
        return Files.readAllBytes(imagePath);
    }
    @GetMapping("/delete/{id}")
    public String deleteBird(@PathVariable Long id) {
        birdService.deleteBird(id);
        return "redirect:/birds";
    }
    @GetMapping("/edit/{id}")
    @ResponseBody
    public Bird getBirdById(@PathVariable Long id) {
        return birdService.getBirdById(id);
    }

    @PostMapping("/update")
    public String updateBird(@ModelAttribute Bird bird, @RequestParam("image") MultipartFile imageFile) {
        if (!imageFile.isEmpty()) {
            try {
                // Lưu ảnh mới vào thư mục
                String fileName = System.currentTimeMillis() + "_" + imageFile.getOriginalFilename();
                Path filePath = Paths.get(UPLOAD_DIR + fileName);
                Files.write(filePath, imageFile.getBytes());

                bird.setImageUrl(fileName); // Lưu ảnh mới
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            // Không chọn ảnh mới => giữ ảnh cũ
            Bird existingBird = birdService.getBirdById(bird.getId());
            bird.setImageUrl(existingBird.getImageUrl());
        }
        birdService.saveBird(bird);
        return "redirect:/birds";
    }

    @GetMapping("/")
    public String redirectToBirds() {
        return "redirect:/birds";
    }
}
