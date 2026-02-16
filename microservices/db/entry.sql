DROP DATABASE IF EXISTS room_scheduling_db;
CREATE DATABASE room_scheduling_db WITH OWNER = "root";

\c room_scheduling_db;

-- ===================== USERS =====================

CREATE SCHEMA IF NOT EXISTS auth;
GRANT ALL PRIVILEGES ON SCHEMA auth TO "root";

CREATE TABLE IF NOT EXISTS auth.tb_users
(
    user_id BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    user_name CHARACTER VARYING COLLATE pg_catalog."default" NOT NULL,
    user_created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    user_last_update_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    user_lastname CHARACTER VARYING COLLATE pg_catalog."default",
    user_email CHARACTER VARYING COLLATE pg_catalog."default" NOT NULL,
    user_status INTEGER NOT NULL,
    user_role INTEGER NOT NULL,
    user_verified_at TIMESTAMP WITHOUT TIME ZONE,
    user_password CHARACTER VARYING COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT tb_users_pkey PRIMARY KEY (user_id)
)

    TABLESPACE pg_default;

ALTER TABLE IF EXISTS auth.tb_users OWNER to "root";

INSERT INTO auth.tb_users(user_name, user_created_at, user_last_update_at, user_lastname, user_email, user_password, user_status, user_role)
VALUES (
    'user_1',
    '2022-11-13 17:49:02',
    '2022-11-13 17:49:02',
    'last_name',
    'email@email.com',
    'pass',
    1,
    1
);

-- ===================== Resources/Rooms =====================

CREATE SCHEMA IF NOT EXISTS resources;
GRANT ALL PRIVILEGES ON SCHEMA resources TO "root";

CREATE TABLE IF NOT EXISTS resources.tb_rooms
(
    room_id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    room_name CHARACTER VARYING COLLATE pg_catalog."default" NOT NULL,
    room_size INTEGER NOT NULL,
    room_created_at DATE NOT NULL,
    room_last_update_at DATE NOT NULL,
    CONSTRAINT tb_rooms_pkey PRIMARY KEY (room_id)
)

    TABLESPACE pg_default;

ALTER TABLE IF EXISTS resources.tb_rooms OWNER to "root";

INSERT INTO resources.tb_rooms(room_name, room_size, room_created_at, room_last_update_at)
VALUES ('room_1', 5, '2022-11-07', '2022-11-07');

-- ===================== Booking / Schedules =====================

CREATE SCHEMA IF NOT EXISTS booking;
GRANT ALL PRIVILEGES ON SCHEMA booking TO "root";

CREATE TABLE IF NOT EXISTS booking.tb_schedules
(
    sch_id BIGSERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    user_id BIGINT NOT NULL REFERENCES auth.tb_users(user_id),
    room_id INTEGER NOT NULL REFERENCES resources.tb_rooms(room_id),
    sch_booking_start TIMESTAMP NOT NULL,
    sch_booking_end TIMESTAMP NOT NULL,
    sch_created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    sch_last_update_at TIMESTAMP NOT NULL DEFAULT NOW(),
    CONSTRAINT chk_schedule_time CHECK (sch_booking_start < sch_booking_end),
    CONSTRAINT uniq_schedule UNIQUE (room_id, sch_booking_start, sch_booking_end)
);

-- Optional: insert example data
INSERT INTO booking.tb_schedules(name, user_id, room_id, sch_booking_start, sch_booking_end, sch_created_at, sch_last_update_at)
VALUES (
    'Reunião 1',
    1,
    1,
    '2022-11-13 17:00:00',
    '2022-11-13 18:00:00',
    '2022-11-17 16:53:05',
    '2022-11-17 16:53:05'
);
