package com.example.model;

import jakarta.persistence.*;
import lombok.*;

import java.util.ArrayList;
import java.util.List;

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
    @Column(columnDefinition = "TEXT")
    private String tinhTrangBaoTon;
    private String shst;
    @Column(columnDefinition = "TEXT")
    private String nguonDanTL;
    private String nguoiCapNhat;

    @OneToMany(mappedBy = "bird", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
    @OrderBy("stt ASC")
    private List<Image> images = new ArrayList<>();

}
