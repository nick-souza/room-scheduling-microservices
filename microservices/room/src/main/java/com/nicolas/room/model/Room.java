package com.nicolas.room.model;

import lombok.Data;

import javax.persistence.*;
import java.time.LocalDateTime;

@Data
@Entity
@Table(name = "tb_rooms", schema = "resources")
public class Room {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "room_id")
    private Long id;

    @Column(name = "room_name")
    private String name;

    @Column(name = "room_size")
    private Integer capacity;

    @Column(name = "room_created_at")
    private LocalDateTime createdAt;

    @Column(name = "room_last_update_at")
    private LocalDateTime lastUpdateAt;
}
