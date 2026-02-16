package com.nicolas.user.model;

import com.nicolas.user.model.Enums.Role;
import com.nicolas.user.model.Enums.Status;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Data
@Entity
@Table(name = "tb_users", schema = "auth")
public class User {

    protected static final DateTimeFormatter FORMATO_DATA = DateTimeFormatter.ofPattern("dd/MM/yyyy");

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id")
    private Long id;

    @Column(name = "user_email", unique = true)
    private String email;

    @Column(name = "user_name")
    private String name;

    @Column(name = "user_lastname")
    private String lastName;

    @Column(name = "user_password")
    private String password;

    @Column(name = "user_status")
    private Status status;

    @Column(name = "user_role")
    private Role role;

    @Column(name = "user_verified_at")
    private LocalDateTime verifiedAt;

    @Column(name = "user_created_at")
    private LocalDateTime createdAt;

    @Column(name = "user_last_update_at")
    private LocalDateTime lastUpdateAt;
}
