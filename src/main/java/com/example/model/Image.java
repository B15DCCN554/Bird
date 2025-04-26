package com.example.model;

import jakarta.persistence.*;
import lombok.*;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor

@Entity
@Table(name = "images")
public class Image {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Lob
    @Column(columnDefinition = "LONGBLOB") // Hoặc MEDIUMBLOB nếu phù hợp
    private byte[] imageData;

    private int stt;

    @ManyToOne
    @JoinColumn(name = "bird_id", nullable = false)
    private Bird bird;

    public Image(byte[] imageData, int stt, Bird bird) {
        this.imageData = imageData;
        this.stt = stt;
        this.bird = bird;
    }
}

