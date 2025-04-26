package com.example.service;

import com.example.model.Bird;
import com.example.model.Image;
import com.example.repository.BirdRepository;
import com.example.repository.ImageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.data.domain.Page;
import org.springframework.web.multipart.MultipartFile;
import java.util.List;
import java.io.IOException;
import java.util.Optional;


@Service
public class ImageService {
    @Autowired
    private ImageRepository imageRepository;

    @Autowired
    private BirdRepository birdRepository;

    // Thêm ảnh cho một Bird
    public void addImage(Long birdId, MultipartFile file, int index) throws IOException {
        Bird bird = birdRepository.findById(birdId).orElseThrow();
        List<Image> images = bird.getImages();

        Image image;
        if (images.size() > index) {
            // Cập nhật ảnh cũ
            image = images.get(index);
            image.setImageData(file.getBytes());
        } else {
            // Thêm mới nếu chưa có ảnh ở vị trí đó
            image = new Image();
            image.setBird(bird);
            image.setImageData(file.getBytes());
            image.setStt(index);
            images.add(image);
        }

        imageRepository.save(image);
    }

    // Lấy danh sách ảnh của một Bird
    public List<Image> getImagesByBirdId(Long birdId) {
        return imageRepository.findByBirdId(birdId);
    }

    // Lấy ảnh theo ID
    public Optional<Image> getImageById(Long imageId) {
        return imageRepository.findById(imageId);
    }
    // Xóa một ảnh theo ID
    public void deleteImage(Long imageId) {
        imageRepository.deleteById(imageId);
    }
}
