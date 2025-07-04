package com.example.repository;

import com.example.model.Image;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ImageRepository extends JpaRepository<Image, Long> {
    List<Image> findByBirdId(Long birdId); // Lấy danh sách ảnh theo Bird ID
}

