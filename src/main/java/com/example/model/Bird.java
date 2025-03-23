package com.example.model;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "birds")
@Getter @Setter @NoArgsConstructor @AllArgsConstructor
public class Bird {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String species;
    private String description;
    private String imageUrl; // Lưu tên file ảnh
}
