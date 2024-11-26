ALTER TABLE `users` ADD `customer_id` BIGINT UNSIGNED NOT NULL DEFAULT '510035' AFTER `id`;

-- UPDATE `users` SET `customer_id` = `customer_id` + `id` WHERE `users`.`id` != 1;


ALTER TABLE `users` ADD `image` VARCHAR(191) NULL AFTER `phone`;


ALTER TABLE `stores` ADD `address` TEXT NULL AFTER `deleted_at`, ADD `coordinates` VARCHAR(100) NULL AFTER `address`, ADD `email_1` VARCHAR(50) NULL AFTER `coordinates`, ADD `email_2` VARCHAR(50) NULL AFTER `email_1`, ADD `phone_1` VARCHAR(10) NULL AFTER `email_2`, ADD `phone_2` VARCHAR(10) NULL AFTER `phone_1`;


-- Latest --
INSERT INTO `app_settings` (`name`, `value`) VALUES ('currency', '$');

ALTER TABLE `users` ADD `navbar` BOOLEAN NOT NULL DEFAULT TRUE AFTER `mode`;