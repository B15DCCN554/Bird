package com.example.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.model.Bird;

public interface BirdRepository extends JpaRepository<Bird, Long> {
}
