package com.nicolas.schedule.model;

import lombok.Data;

import javax.persistence.*;
import java.time.LocalDateTime;

@Data
@Entity
@Table(name = "tb_schedules", schema = "booking")
public class Schedule {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "sch_id")
    private Long id;

    @Column(name = "name")
    private String name;

    @Column(name = "user_id")
    private Long responsibleId;

    @Column(name = "room_id")
    private Long roomId;

    @Column(name = "sch_booking_start")
    private LocalDateTime bookingStart;

    @Column(name = "sch_booking_end")
    private LocalDateTime bookingEnd;

    @Column(name = "sch_created_at")
    private LocalDateTime createdAt;

    @Column(name = "sch_last_update_at")
    private LocalDateTime lastUpdateAt;
}
