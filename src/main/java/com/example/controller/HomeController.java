package com.example.controller;

import com.example.config.AppConfig;
import com.example.model.Bird;
import com.example.model.Image;
import com.example.service.BirdService;
import com.example.service.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;

@Controller
public class HomeController {
    @Autowired
    private BirdService birdService;
    @Autowired
    private ImageService imageService;
    @Autowired
    private AppConfig appConfig;
//    @GetMapping("/")
//    public String homePage(Model model) {
//        model.addAttribute("birds", birdService.getAllBirds());
//        return "index";
//    }

    @GetMapping()
    public String listBirds(@RequestParam(required = false) String ten,
                            @RequestParam(required = false) String bo,
                            @RequestParam(required = false) String ho,
                            @RequestParam(defaultValue = "0") int page,
                            @RequestParam(defaultValue = "12") int size,
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
        model.addAttribute("backgroundImageUrlFooter", appConfig.getBackgroundImageUrlFooter());
        model.addAttribute("backgroundImageUrlHeader", appConfig.getBackgroundImageUrlHeader());
        model.addAttribute("appTitle", appConfig.getAppTitle());
        return "index";
    }


    @GetMapping("/bird/detail/{id}")
    public String birdDetail(@PathVariable("id") Long id, Model model) {
        Bird bird = birdService.getBirdById(id);
        List<Image> lst = bird.getImages();
        Image image = lst.get(0);
        lst.remove(0);
        bird.setImages(lst);
        if (bird == null) {
            // Nếu không tìm thấy, chuyển hướng về trang danh sách hoặc trang lỗi
            return "redirect:/birds";
        }
        model.addAttribute("bird", bird);
        model.addAttribute("imageMain", image);
        model.addAttribute("backgroundImageUrlFooter", appConfig.getBackgroundImageUrlFooter());
        model.addAttribute("backgroundImageUrlHeader", appConfig.getBackgroundImageUrlHeader());
        model.addAttribute("appTitle", appConfig.getAppTitle());
        return "bird_detail"; // Tên file template: bird-detail.html
    }

    @GetMapping("/image/{imageId}")
    @ResponseBody
    public ResponseEntity<byte[]> getImage(@PathVariable Long imageId) {
        System.out.println(imageId);
        Optional<Image> imageOptional = imageService.getImageById(imageId);
        if (imageOptional.isPresent()) {
            Image image = imageOptional.get();
            System.out.println(image.getId());
            return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(image.getImageData());
        }
        return ResponseEntity.notFound().build();
    }

    @GetMapping("/images-local/{filename}")
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
}
