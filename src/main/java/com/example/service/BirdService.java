package com.example.service;

import com.example.model.Bird;
import com.example.repository.BirdRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BirdService {
    @Autowired
    private BirdRepository repository;

    public List<Bird> getAllBirds() {
        return repository.findAll();
    }

    public void saveBird(Bird bird) {
        repository.save(bird);
    }

    public void deleteBird(Long id) {
        repository.deleteById(id);
    }
    public Bird getBirdById(Long id) {
        return repository.findById(id).orElse(null);
    }

}
