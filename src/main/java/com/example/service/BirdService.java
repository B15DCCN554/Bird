package com.example.service;

import com.example.model.Bird;
import com.example.repository.BirdRepository;
import com.example.repository.ImageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.data.domain.Page;

import java.util.List;

@Service
public class BirdService {
    @Autowired
    private BirdRepository repository;

    @Autowired
    private ImageRepository imageRepository;

    public List<Bird> getAllBirds() {
        return repository.findAll();
    }

    public Page<Bird> getAllBirds(Pageable pageable) {
        return repository.findAll(pageable);
    }


    public Bird saveBird(Bird bird) {
       return repository.save(bird);
    }

    public void deleteBird(Long id) {
        repository.deleteById(id);
    }

    public Bird getBirdById(Long id) {
        return repository.findById(id).orElse(null);
    }

    public Page<Bird> searchBirds(String ten, String bo, String ho, int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        return repository.searchBirds(ten, bo, ho, pageable);
    }

}
