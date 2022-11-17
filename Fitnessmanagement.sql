CREATE TABLE `diet_plan` (
  `ex_id` varchar NOT NULL ,
  `recipe` varchar(30) DEFAULT NULL,
  `calories` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `exercise_routine` (
  `ex_routine_id` varchar NOT NULL,
  `duration` time NOT NULL,
  `calories` int(10) DEFAULT NULL,
  `id` varchar NOT NULL ,
  `ex_id` varchar NOT NULL 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `daily_log` (
  `loyalty_id` varchar NOT NULL,
  `duration` date NOT NULL,
  `calories_burnt` int(10) DEFAULT NULL,
  `calories_consumed` int(10) DEFAULT NULL,
  `feedback` varchar(20) DEFAULT NULL,
  `ex_routine_id` varchar NOT NULL 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `diet_plan_recipe` (
  `recipe` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `does` (
  `id` varchar NOT NULL,
  `ex_routine_id` varchar NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `exercise_list` (
  `ex_id` varchar NOT NULL ,
  `description` varchar(30) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `loyal_pts` (
  `loyalty_id` varchar NOT NULL ,
  `level` int(3) NOT NULL,
  `streaks` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `user_info` (
  `id` varchar NOT NULL PRIMARY,
  `gender` varchar(1) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `fname` varchar(20) NOT NULL,
  `mname` varchar(20) DEFAULT NULL,
  `lname` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `membership_type` (
  `type_id` varchar NOT NULL,
  `duration` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `id` varchar NOT NULL ,
  `trainer_id` varchar NOT NULL 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `user_info_mail` (
  `id` varchar NOT NULL ,
  `email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `trainer` (
  `trainer_id` varchar NOT NULL PRIMARY,
  `phoneno` int(10) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `name` varchar(20) NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------

ALTER TABLE `diet_plan`
  ADD KEY `ex_id` (`ex_id`),
  ADD KEY `recipe` (`recipe`);

ALTER TABLE `exercise_routine`
  ADD PRIMARY KEY (`ex_routine_id`),
  ADD KEY `id` (`id`),
  ADD KEY `ex_id` (`ex_id`);

ALTER TABLE `daily_log`
  ADD PRIMARY KEY (`loyalty_id`),
  ADD KEY `ex_routine_id` (`ex_routine_id`);

ALTER TABLE `diet_plan_recipe`
  ADD KEY `recipe` (`recipe`);

ALTER TABLE `does`
  ADD PRIMARY KEY (`id`,`ex_routine_id`),
  ADD KEY `id` (`id`),
  ADD KEY `ex_routine_id` (`ex_routine_id`)

ALTER TABLE `exercise_list`
  ADD PRIMARY KEY (`ex_id`);

ALTER TABLE `loyalty_pts`
  ADD KEY (`loyalty_id`);  

ALTER TABLE `membership_type`
  ADD PRIMARY KEY (`type_id`),
  ADD KEY `id` (`id`),
  ADD KEY `trainer_id` (`trainer_id`);

ALTER TABLE `user_info_mail`
  ADD PRIMARY KEY (`id`,`email`),
  ADD KEY `id` (`id`);

-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------

ALTER TABLE `diet_plan`
  ADD CONSTRAINT `diet_plan_ibfk_1` FOREIGN KEY (`ex_routine_id`) REFERENCES `exercise_routine` (`ex_routine_id`);

ALTER TABLE `diet_plan`
  ADD CONSTRAINT `diet_plan_ibfk_2` FOREIGN KEY (`recipe`) REFERENCES `diet_plan_recipe` (`recipe`);

ALTER TABLE `exercise_routine`
  ADD CONSTRAINT `exercise_routine_ibfk_1` FOREIGN KEY (`ex_id`) REFERENCES `exercise_list` (`ex_id`);

ALTER TABLE `does`
  ADD CONSTRAINT `does_ibfk_1` FOREIGN KEY (`ex_routine_id`) REFERENCES `exercise_routine` (`ex_routine_id`);

ALTER TABLE `daily_log`
  ADD CONSTRAINT `daily_log_ibfk_1` FOREIGN KEY (`ex_routine_id`) REFERENCES `exercise_routine` (`ex_routine_id`);

ALTER TABLE `loyalty_pts`
  ADD CONSTRAINT `loyalty_pts_ibfk_1` FOREIGN KEY (`loyalty_id`) REFERENCES `daily_log` (`loyalty_id`);

ALTER TABLE `does`
  ADD CONSTRAINT `does_ibfk_2` FOREIGN KEY (`id`) REFERENCES `user_info` (`id`);

ALTER TABLE `user_info_email`
  ADD CONSTRAINT `user_info_email_ibfk_1` FOREIGN KEY (`id`) REFERENCES `user_info` (`id`);

ALTER TABLE `membership_type`
  ADD CONSTRAINT `membership_type_ibfk_1` FOREIGN KEY (`id`) REFERENCES `user_info` (`id`);

ALTER TABLE `membership_type`
  ADD CONSTRAINT `membership_type_ibfk_2` FOREIGN KEY (`trainer_id`) REFERENCES `trainer` (`trainer_id`);