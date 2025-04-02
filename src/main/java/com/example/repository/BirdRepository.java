package com.example.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import com.example.model.Bird;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface BirdRepository extends JpaRepository<Bird, Long> {
    @Query("SELECT b FROM Bird b WHERE " +
            "(:ten IS NULL OR LOWER(b.ten) LIKE LOWER(CONCAT('%', :ten, '%'))) " +
            "AND (:bo IS NULL OR b.bo = :bo) " +
            "AND (:ho IS NULL OR b.ho = :ho)")
    Page<Bird> searchBirds(@Param("ten") String ten,
                           @Param("bo") String bo,
                           @Param("ho") String ho,
                           Pageable pageable);
}
