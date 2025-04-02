package com.example.model;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "birds")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Bird {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String ten;
    private String gioi;
    private String nganh;
    private String lop;
    private String bo;
    private String ho;
    private String chi;
    private String loai;
    @Column(columnDefinition = "TEXT")
    private String mota;
    private String tinhTrangBaoTon;
    private String imageUrl;
}
