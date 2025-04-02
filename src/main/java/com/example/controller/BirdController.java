package com.example.controller;

import com.example.model.Bird;
import com.example.service.BirdService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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

    @GetMapping()
    public String listBirds(@RequestParam(required = false) String ten,
                            @RequestParam(required = false) String bo,
                            @RequestParam(required = false) String ho,
                            @RequestParam(defaultValue = "0") int page,
                            @RequestParam(defaultValue = "5") int size,
                            Model model) {
        Page<Bird> birdPage = null;
        if ((null == ten || ten.isEmpty()) && (null == bo || bo.isEmpty()) && (null == ho || ho.isEmpty())) {
            birdPage = birdService.getAllBirds(PageRequest.of(page, size));
        } else {
            if (null == ten || ten.isEmpty()) ten = null;
            if (null == bo || bo.isEmpty()) bo = null;
            if (null == ho || ho.isEmpty()) ho = null;
            birdPage = birdService.searchBirds(ten, bo, ho, page, size);
        }
        int startIndex = page * size;
        model.addAttribute("bird", new Bird());
        model.addAttribute("birds", birdPage.getContent());  // Lấy danh sách chim từ Page
        model.addAttribute("birdPage", birdPage);
        model.addAttribute("ten", ten);
        model.addAttribute("bo", bo);
        model.addAttribute("ho", ho);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", birdPage.getTotalPages());
        model.addAttribute("startIndex", startIndex);
        return "birds";
    }

    @PostMapping("/add")
    public String addBird(@ModelAttribute Bird bird, @RequestParam("imageFile") MultipartFile imageFile) {
        if (!imageFile.isEmpty()) {
            try {
                // Tạo thư mục nếu chưa có
                File uploadDir = new File(UPLOAD_DIR);
                if (!uploadDir.exists()) uploadDir.mkdirs();

                // Lưu ảnh vào thư mục uploads/
                String fileName = System.currentTimeMillis() + "_" + imageFile.getOriginalFilename();
                Path filePath = Paths.get(UPLOAD_DIR + fileName);
                Files.write(filePath, imageFile.getBytes());

                bird.setImageUrl("/images/" + fileName);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        birdService.saveBird(bird);
        return "redirect:/birds";
    }

    @PostMapping("/update")
    public String updateBird(@ModelAttribute Bird bird, @RequestParam("imageFile") MultipartFile imageFile) {
        if (!imageFile.isEmpty()) {
            try {
                // Lưu ảnh mới vào thư mục
                String fileName = System.currentTimeMillis() + "_" + imageFile.getOriginalFilename();
                Path filePath = Paths.get(UPLOAD_DIR + fileName);
                Files.write(filePath, imageFile.getBytes());

                bird.setImageUrl("/images/" + fileName); // Lưu ảnh mới
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

    @GetMapping("/images/{filename}")
    @ResponseBody
    public ResponseEntity<byte[]> getImage(@PathVariable String filename) throws IOException {
        Path imagePath = Paths.get("uploads").resolve(filename);

        if (!Files.exists(imagePath)) {
            System.out.println("File not found: " + imagePath.toAbsolutePath());
            return ResponseEntity.notFound().build();
        }
        System.out.println(imagePath.getFileName());
        byte[] imageBytes = Files.readAllBytes(imagePath);
        return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes);
    }

    @PostMapping("/delete")
    public String deleteBird(@RequestParam("id") Long id) {
        birdService.deleteBird(id);
        return "redirect:/birds";  // Quay lại trang danh sách sau khi xóa
    }


    @GetMapping("/edit/{id}")
    @ResponseBody
    public Bird getBirdById(@PathVariable Long id) {
        return birdService.getBirdById(id);
    }


    @GetMapping("/")
    public String redirectToBirds() {
        return "redirect:/birds";
    }
}
