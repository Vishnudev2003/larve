CREATE TABLE `followings` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `follower_id` int NOT NULL DEFAULT '0' COMMENT 'Who following',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

ALTER TABLE `followings` ADD PRIMARY KEY (`id`);
ALTER TABLE `followings` MODIFY `id` bigint NOT NULL AUTO_INCREMENT;


CREATE TABLE `goals` (
  `id` bigint NOT NULL,
  `user_id` int DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `target_amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `starting_amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `view_publicly` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1→Yes, 0→No',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0->disabled,1->Running, 2->Completed,',
  `thanks_message` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

ALTER TABLE `goals` ADD PRIMARY KEY (`id`);
ALTER TABLE `goals` MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

CREATE TABLE `goal_logs` (
  `id` bigint NOT NULL,
  `goal_id` int NOT NULL DEFAULT '0',
  `user_id` int NOT NULL DEFAULT '0',
  `amount` decimal(28,8) NOT NULL DEFAULT '0.00000000',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

ALTER TABLE `goal_logs` ADD PRIMARY KEY (`id`);
ALTER TABLE `goal_logs` MODIFY `id` bigint NOT NULL AUTO_INCREMENT;


ALTER TABLE `deposits` CHANGE `donation_sign` `donation_sign` TINYINT(1) NOT NULL DEFAULT '0' COMMENT '4 =>is goal gift,3 =>is membership, 1-> Is simple donation,\r\n0->is deposit.';
ALTER TABLE `deposits` ADD `goal_id` INT NOT NULL DEFAULT '0' AFTER `donation_id`;
ALTER TABLE `membership_levels` ADD `status` TINYINT(1) NOT NULL DEFAULT '0' COMMENT 'active-1, Inactive 0' AFTER `welcome_msg`;

INSERT INTO `frontends` (`data_keys`, `data_values`, `tempname`, `created_at`, `updated_at`) VALUES ('goal.content', '{\"heading\":\"Set Your Goal, Unlock Your Desire: Start Today!\", \"subheading\":\"HIGHLY RECOMMENDED FACILITY\"}', 'basic', NULL, NULL);