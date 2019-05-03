-- Adminer 4.7.1 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `wp_car_rental_benefits`;
CREATE TABLE `wp_car_rental_benefits` (
  `benefit_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `benefit_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `benefit_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `demo_benefit_image` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `benefit_order` int(11) unsigned NOT NULL DEFAULT '1',
  `blog_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`benefit_id`),
  KEY `benefit_order` (`benefit_order`),
  KEY `blog_id` (`blog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wp_car_rental_body_types`;
CREATE TABLE `wp_car_rental_body_types` (
  `body_type_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `body_type_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body_type_order` int(11) unsigned NOT NULL DEFAULT '1',
  `blog_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`body_type_id`),
  KEY `body_type_order` (`body_type_order`),
  KEY `blog_id` (`blog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



DROP TABLE IF EXISTS `wp_car_rental_bookings`;
CREATE TABLE `wp_car_rental_bookings` (
  `booking_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `booking_code` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_timestamp` int(11) unsigned NOT NULL DEFAULT '0',
  `last_edit_timestamp` int(11) unsigned NOT NULL DEFAULT '0',
  `pickup_timestamp` int(11) unsigned NOT NULL DEFAULT '0',
  `return_timestamp` int(11) unsigned NOT NULL DEFAULT '0',
  `pickup_location_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `return_location_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `partner_id` int(11) NOT NULL DEFAULT '-1',
  `manufacturer_id` int(11) NOT NULL DEFAULT '-1',
  `body_type_id` int(11) NOT NULL DEFAULT '-1',
  `transmission_type_id` int(11) NOT NULL DEFAULT '-1',
  `fuel_type_id` int(11) NOT NULL DEFAULT '-1',
  `customer_id` int(11) unsigned NOT NULL DEFAULT '0',
  `payment_method_code` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_successful` tinyint(1) NOT NULL DEFAULT '0',
  `payment_transaction_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payer_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_block` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_cancelled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_completed_early` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `block_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blog_id` int(11) unsigned NOT NULL DEFAULT '0',
  `finish` int(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`booking_id`),
  UNIQUE KEY `booking_code` (`booking_code`),
  KEY `booking_timestamp` (`booking_timestamp`),
  KEY `last_edit_timestamp` (`last_edit_timestamp`),
  KEY `pickup_timestamp` (`pickup_timestamp`),
  KEY `customer_id` (`customer_id`),
  KEY `is_cancelled` (`is_cancelled`),
  KEY `coupon_code` (`coupon_code`),
  KEY `return_timestamp` (`return_timestamp`),
  KEY `pickup_location_code` (`pickup_location_code`),
  KEY `return_location_code` (`return_location_code`),
  KEY `is_completed_early` (`is_completed_early`),
  KEY `blog_id` (`blog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



DROP TABLE IF EXISTS `wp_car_rental_booking_options`;
CREATE TABLE `wp_car_rental_booking_options` (
  `booking_id` int(11) unsigned NOT NULL DEFAULT '0',
  `item_sku` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extra_sku` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `option_id` int(11) unsigned NOT NULL DEFAULT '0',
  `units_booked` int(11) NOT NULL DEFAULT '1',
  `blog_id` int(11) unsigned NOT NULL DEFAULT '0',
  KEY `booking_id` (`booking_id`),
  KEY `option_id` (`option_id`),
  KEY `item_sku` (`item_sku`),
  KEY `extra_sku` (`extra_sku`),
  KEY `blog_id` (`blog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



DROP TABLE IF EXISTS `wp_car_rental_calendar`;
CREATE TABLE `wp_car_rental_calendar` (
  `booking_id` int(255) unsigned NOT NULL,
  `fast_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blog_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wp_car_rental_closed_dates`;
CREATE TABLE `wp_car_rental_closed_dates` (
  `closed_date` date NOT NULL DEFAULT '0000-00-00',
  `location_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `blog_id` int(11) unsigned NOT NULL DEFAULT '0',
  KEY `closed_date` (`closed_date`),
  KEY `location_code` (`location_code`),
  KEY `blog_id` (`blog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wp_car_rental_customers`;
CREATE TABLE `wp_car_rental_customers` (
  `customer_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthdate` date NOT NULL DEFAULT '0000-00-00',
  `street_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip_code` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comments` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `existing_customer` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `registration_timestamp` int(11) unsigned NOT NULL DEFAULT '0',
  `last_visit_timestamp` int(11) unsigned NOT NULL DEFAULT '0',
  `blog_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`customer_id`),
  KEY `email` (`email`),
  KEY `registration_timestamp` (`registration_timestamp`),
  KEY `last_visit_timestamp` (`last_visit_timestamp`),
  KEY `blog_id` (`blog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wp_car_rental_discounts`;
CREATE TABLE `wp_car_rental_discounts` (
  `discount_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `discount_type` tinyint(11) unsigned NOT NULL DEFAULT '1',
  `coupon_discount` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `price_plan_id` int(11) unsigned NOT NULL DEFAULT '0',
  `extra_id` int(11) unsigned NOT NULL DEFAULT '0',
  `period_from` int(11) unsigned NOT NULL DEFAULT '0',
  `period_till` int(11) unsigned NOT NULL DEFAULT '0',
  `discount_percentage` decimal(10,3) unsigned NOT NULL DEFAULT '0.000',
  `blog_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`discount_id`),
  KEY `discount_type` (`discount_type`),
  KEY `coupon_discount` (`coupon_discount`),
  KEY `price_plan_id` (`price_plan_id`),
  KEY `extra_id` (`extra_id`),
  KEY `period` (`period_from`,`period_till`),
  KEY `discount_percentage` (`discount_percentage`),
  KEY `blog_id` (`blog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



DROP TABLE IF EXISTS `wp_car_rental_distances`;
CREATE TABLE `wp_car_rental_distances` (
  `distance_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pickup_location_id` int(11) unsigned NOT NULL DEFAULT '0',
  `return_location_id` int(11) unsigned NOT NULL DEFAULT '0',
  `show_distance` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `distance` decimal(10,1) unsigned NOT NULL DEFAULT '0.0',
  `distance_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `blog_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`distance_id`),
  KEY `pickup_location_id` (`pickup_location_id`),
  KEY `return_location_id` (`return_location_id`),
  KEY `blog_id` (`blog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wp_car_rental_emails`;
CREATE TABLE `wp_car_rental_emails` (
  `email_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email_type` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `email_subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `blog_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`email_id`),
  KEY `email_type` (`email_type`),
  KEY `blog_id` (`blog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wp_car_rental_extras`;
CREATE TABLE `wp_car_rental_extras` (
  `extra_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `extra_sku` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `partner_id` int(11) unsigned NOT NULL DEFAULT '0',
  `item_id` int(11) unsigned NOT NULL DEFAULT '0',
  `extra_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `price_type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `fixed_rental_deposit` decimal(10,2) NOT NULL DEFAULT '0.00',
  `units_in_stock` int(11) unsigned NOT NULL DEFAULT '1',
  `max_units_per_booking` int(11) unsigned NOT NULL DEFAULT '1',
  `options_display_mode` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `options_measurement_unit` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `blog_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`extra_id`),
  KEY `extra_sku` (`extra_sku`),
  KEY `partner_id` (`partner_id`),
  KEY `item_id` (`item_id`),
  KEY `blog_id` (`blog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



DROP TABLE IF EXISTS `wp_car_rental_features`;
CREATE TABLE `wp_car_rental_features` (
  `feature_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `feature_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_in_item_list` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `blog_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`feature_id`),
  KEY `display_in_item_list` (`display_in_item_list`),
  KEY `blog_id` (`blog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



DROP TABLE IF EXISTS `wp_car_rental_fuel_types`;
CREATE TABLE `wp_car_rental_fuel_types` (
  `fuel_type_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fuel_type_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `blog_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fuel_type_id`),
  KEY `blog_id` (`blog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wp_car_rental_invoices`;
CREATE TABLE `wp_car_rental_invoices` (
  `booking_id` int(11) unsigned NOT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `grand_total` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '$ 0.00',
  `fixed_deposit_amount` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '$ 0.00',
  `total_pay_now` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '$ 0.00',
  `total_pay_later` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '$ 0.00',
  `pickup_location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `return_location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `blog_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`booking_id`),
  KEY `blog_id` (`blog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wp_car_rental_items`;
CREATE TABLE `wp_car_rental_items` (
  `item_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_sku` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_page_id` int(11) unsigned NOT NULL DEFAULT '0',
  `partner_id` int(11) unsigned NOT NULL DEFAULT '0',
  `manufacturer_id` int(11) unsigned NOT NULL DEFAULT '0',
  `body_type_id` int(11) unsigned NOT NULL DEFAULT '0',
  `transmission_type_id` int(11) unsigned NOT NULL DEFAULT '0',
  `fuel_type_id` int(11) unsigned NOT NULL DEFAULT '0',
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_image_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_image_2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_image_3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `demo_item_image_1` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `demo_item_image_2` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `demo_item_image_3` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `mileage` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fuel_consumption` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `engine_capacity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_passengers` int(11) unsigned NOT NULL DEFAULT '5',
  `max_luggage` int(11) unsigned NOT NULL DEFAULT '2',
  `item_doors` int(11) unsigned NOT NULL DEFAULT '5',
  `min_driver_age` int(11) unsigned NOT NULL DEFAULT '18',
  `price_group_id` int(11) unsigned NOT NULL DEFAULT '0',
  `fixed_rental_deposit` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `units_in_stock` int(11) unsigned NOT NULL DEFAULT '1',
  `max_units_per_booking` int(11) unsigned NOT NULL DEFAULT '1',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `display_in_slider` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `display_in_item_list` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `display_in_price_table` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `display_in_calendar` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `options_display_mode` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `options_measurement_unit` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `blog_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_id`),
  KEY `display_in_slider` (`display_in_slider`),
  KEY `display_in_price_table` (`display_in_price_table`),
  KEY `item_description_page_id` (`item_page_id`),
  KEY `body_type_id` (`body_type_id`),
  KEY `fuel_type_id` (`fuel_type_id`),
  KEY `transmission_type_id` (`transmission_type_id`),
  KEY `units_in_stock` (`units_in_stock`),
  KEY `max_units_per_booking` (`max_units_per_booking`),
  KEY `enabled` (`enabled`),
  KEY `display_in_item_list` (`display_in_item_list`),
  KEY `display_in_calendar` (`display_in_calendar`),
  KEY `manufacturer_id` (`manufacturer_id`),
  KEY `item_sku` (`item_sku`),
  KEY `partner_id` (`partner_id`),
  KEY `price_group_id` (`price_group_id`),
  KEY `blog_id` (`blog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wp_car_rental_item_features`;
CREATE TABLE `wp_car_rental_item_features` (
  `item_id` int(11) unsigned NOT NULL DEFAULT '0',
  `feature_id` int(11) unsigned NOT NULL DEFAULT '0',
  `blog_id` int(11) unsigned NOT NULL DEFAULT '0',
  KEY `item_id` (`item_id`),
  KEY `feature_id` (`feature_id`),
  KEY `blog_id` (`blog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



DROP TABLE IF EXISTS `wp_car_rental_item_locations`;
CREATE TABLE `wp_car_rental_item_locations` (
  `item_id` int(11) unsigned NOT NULL DEFAULT '0',
  `location_id` int(11) unsigned NOT NULL DEFAULT '0',
  `location_type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `blog_id` int(11) unsigned NOT NULL DEFAULT '0',
  KEY `item_id` (`item_id`),
  KEY `location` (`location_id`,`location_type`),
  KEY `blog_id` (`blog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



DROP TABLE IF EXISTS `wp_car_rental_locations`;
CREATE TABLE `wp_car_rental_locations` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `location_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_page_id` int(11) unsigned NOT NULL DEFAULT '0',
  `location_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_image_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_image_2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_image_3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_image_4` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `demo_location_image_1` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `demo_location_image_2` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `demo_location_image_3` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `demo_location_image_4` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `street_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip_code` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pickup_fee` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `return_fee` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `open_mondays` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `open_tuesdays` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `open_wednesdays` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `open_thursdays` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `open_fridays` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `open_saturdays` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `open_sundays` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `open_time_mon` time NOT NULL DEFAULT '08:00:00',
  `open_time_tue` time NOT NULL DEFAULT '08:00:00',
  `open_time_wed` time NOT NULL DEFAULT '08:00:00',
  `open_time_thu` time NOT NULL DEFAULT '08:00:00',
  `open_time_fri` time NOT NULL DEFAULT '08:00:00',
  `open_time_sat` time NOT NULL DEFAULT '08:00:00',
  `open_time_sun` time NOT NULL DEFAULT '08:00:00',
  `close_time_mon` time NOT NULL DEFAULT '19:00:00',
  `close_time_tue` time NOT NULL DEFAULT '19:00:00',
  `close_time_wed` time NOT NULL DEFAULT '19:00:00',
  `close_time_thu` time NOT NULL DEFAULT '19:00:00',
  `close_time_fri` time NOT NULL DEFAULT '19:00:00',
  `close_time_sat` time NOT NULL DEFAULT '19:00:00',
  `close_time_sun` time NOT NULL DEFAULT '19:00:00',
  `lunch_enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lunch_start_time` time NOT NULL DEFAULT '12:00:00',
  `lunch_end_time` time NOT NULL DEFAULT '13:00:00',
  `afterhours_pickup_allowed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `afterhours_pickup_location_id` int(11) unsigned NOT NULL DEFAULT '0',
  `afterhours_pickup_fee` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `afterhours_return_allowed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `afterhours_return_location_id` int(11) unsigned NOT NULL DEFAULT '0',
  `afterhours_return_fee` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `location_order` int(11) unsigned NOT NULL DEFAULT '1',
  `blog_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`location_id`),
  KEY `afterhours_pickup_location_id` (`afterhours_pickup_location_id`),
  KEY `location_code` (`location_code`),
  KEY `location_page_id` (`location_page_id`),
  KEY `afterhours_pickup_allowed` (`afterhours_pickup_allowed`),
  KEY `afterhours_return_allowed` (`afterhours_return_allowed`),
  KEY `afterhours_return_location_id` (`afterhours_return_location_id`),
  KEY `location_order` (`location_order`),
  KEY `blog_id` (`blog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wp_car_rental_logs`;
CREATE TABLE `wp_car_rental_logs` (
  `log_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `log_type` enum('customer-lookup','payment-callback') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'customer-lookup',
  `email` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` smallint(4) unsigned NOT NULL DEFAULT '0',
  `year_required` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `error_message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `debug_log` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.0.0.0',
  `real_ip` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.0.0.0',
  `host` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `browser` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `os` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_requests_left` int(11) NOT NULL DEFAULT '1',
  `failed_requests_left` int(11) NOT NULL DEFAULT '1',
  `email_attempts_left` int(11) NOT NULL DEFAULT '1',
  `is_robot` tinyint(1) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `log_timestamp` int(11) unsigned NOT NULL DEFAULT '0',
  `blog_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`log_id`),
  KEY `email` (`email`),
  KEY `year` (`year`),
  KEY `year_required` (`year_required`),
  KEY `ip` (`ip`),
  KEY `real_ip` (`real_ip`),
  KEY `is_robot` (`is_robot`),
  KEY `status` (`status`),
  KEY `log_timestamp` (`log_timestamp`),
  KEY `log_type` (`log_type`),
  KEY `blog_id` (`blog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wp_car_rental_manufacturers`;
CREATE TABLE `wp_car_rental_manufacturers` (
  `manufacturer_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `manufacturer_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `manufacturer_logo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `demo_manufacturer_logo` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `blog_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`manufacturer_id`),
  KEY `blog_id` (`blog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wp_car_rental_options`;
CREATE TABLE `wp_car_rental_options` (
  `option_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned NOT NULL DEFAULT '0',
  `extra_id` int(11) unsigned NOT NULL DEFAULT '0',
  `option_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `blog_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`option_id`),
  KEY `item_id` (`item_id`),
  KEY `extra_id` (`extra_id`),
  KEY `blog_id` (`blog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wp_car_rental_payment_methods`;
CREATE TABLE `wp_car_rental_payment_methods` (
  `payment_method_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `payment_method_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method_email` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `public_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `private_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sandbox_mode` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `check_certificate` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ssl_only` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `online_payment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `payment_method_enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `payment_method_order` int(11) unsigned NOT NULL DEFAULT '0',
  `expiration_time` int(11) NOT NULL DEFAULT '0',
  `blog_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`payment_method_id`),
  KEY `unpaid_booking_expiration_time` (`expiration_time`),
  KEY `method_enabled` (`payment_method_enabled`),
  KEY `method_order` (`payment_method_order`),
  KEY `payment_method_code` (`payment_method_code`),
  KEY `class_name` (`class_name`),
  KEY `online_payment` (`online_payment`),
  KEY `blog_id` (`blog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wp_car_rental_prepayments`;
CREATE TABLE `wp_car_rental_prepayments` (
  `prepayment_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `period_from` int(11) unsigned NOT NULL DEFAULT '0',
  `period_till` int(11) unsigned NOT NULL DEFAULT '0',
  `item_prices_included` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `item_deposits_included` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `extra_prices_included` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `extra_deposits_included` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pickup_fees_included` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `distance_fees_included` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `return_fees_included` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `prepayment_percentage` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `blog_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`prepayment_id`),
  KEY `period` (`period_from`,`period_till`),
  KEY `blog_id` (`blog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wp_car_rental_price_groups`;
CREATE TABLE `wp_car_rental_price_groups` (
  `price_group_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `partner_id` int(11) unsigned NOT NULL DEFAULT '0',
  `price_group_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `blog_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`price_group_id`),
  KEY `partner_id` (`partner_id`),
  KEY `blog_id` (`blog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



DROP TABLE IF EXISTS `wp_car_rental_price_plans`;
CREATE TABLE `wp_car_rental_price_plans` (
  `price_plan_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `price_group_id` int(11) unsigned NOT NULL DEFAULT '0',
  `coupon_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_timestamp` int(11) unsigned NOT NULL DEFAULT '0',
  `end_timestamp` int(11) unsigned NOT NULL DEFAULT '0',
  `daily_rate_mon` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `daily_rate_tue` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `daily_rate_wed` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `daily_rate_thu` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `daily_rate_fri` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `daily_rate_sat` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `daily_rate_sun` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `hourly_rate_mon` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `hourly_rate_tue` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `hourly_rate_wed` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `hourly_rate_thu` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `hourly_rate_fri` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `hourly_rate_sat` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `hourly_rate_sun` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `seasonal_price` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `blog_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`price_plan_id`),
  KEY `seasonal_price` (`seasonal_price`),
  KEY `period` (`start_timestamp`,`end_timestamp`),
  KEY `price_group_id` (`price_group_id`),
  KEY `coupon_code` (`coupon_code`),
  KEY `blog_id` (`blog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wp_car_rental_settings`;
CREATE TABLE `wp_car_rental_settings` (
  `conf_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conf_value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `blog_id` int(11) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `conf_key` (`conf_key`,`blog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



DROP TABLE IF EXISTS `wp_car_rental_taxes`;
CREATE TABLE `wp_car_rental_taxes` (
  `tax_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tax_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_id` int(11) unsigned NOT NULL DEFAULT '0',
  `location_type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `tax_percentage` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `blog_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tax_id`),
  KEY `location` (`location_id`,`location_type`),
  KEY `blog_id` (`blog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wp_car_rental_transmission_types`;
CREATE TABLE `wp_car_rental_transmission_types` (
  `transmission_type_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `transmission_type_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `blog_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`transmission_type_id`),
  KEY `blog_id` (`blog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



DROP TABLE IF EXISTS `wp_commentmeta`;
CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wp_comments`;
CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wp_links`;
CREATE TABLE `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wp_options`;
CREATE TABLE `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wp_postmeta`;
CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



DROP TABLE IF EXISTS `wp_posts`;
CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wp_termmeta`;
CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wp_terms`;
CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



DROP TABLE IF EXISTS `wp_term_relationships`;
CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



DROP TABLE IF EXISTS `wp_term_taxonomy`;
CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wp_usermeta`;
CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



DROP TABLE IF EXISTS `wp_users`;
CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wp_wpfb_post_templates`;
CREATE TABLE `wp_wpfb_post_templates` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `template_type` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `style` int(2) NOT NULL,
  `created_time_stamp` int(12) NOT NULL,
  `display_num` int(2) NOT NULL,
  `display_num_rows` int(3) NOT NULL,
  `display_order` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hide_no_text` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `template_css` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_rating` int(2) NOT NULL,
  `min_words` int(4) NOT NULL,
  `max_words` int(4) NOT NULL,
  `rtype` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `rpage` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `createslider` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `numslides` int(2) NOT NULL,
  `sliderautoplay` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sliderdirection` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sliderarrows` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sliderdots` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sliderdelay` int(2) NOT NULL,
  `sliderheight` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `showreviewsbyid` varchar(600) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `template_misc` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wp_wpfb_reviews`;
CREATE TABLE `wp_wpfb_reviews` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `pageid` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `pagename` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_time_stamp` int(12) NOT NULL,
  `reviewer_name` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `reviewer_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `rating` int(2) NOT NULL,
  `recommendation_type` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `review_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `hide` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `review_length` int(5) NOT NULL,
  `type` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `userpic` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `userpiclocal` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `wp_wppusher_packages`;


UPDATE wp_options
SET option_value = REPLACE(option_value,
'https://aluguel.procarbrasil.com.br', 'http://localhost/aluguel.procarbrasil.com.br')
WHERE option_name = 'home'
OR option_name = 'siteurl';
				  
UPDATE wp_posts
SET guid = REPLACE (guid,
'https://aluguel.procarbrasil.com.br', 'http://localhost/aluguel.procarbrasil.com.br');		

UPDATE wp_posts
SET post_content = REPLACE (post_content,
'https://aluguel.procarbrasil.com.br', 'http://localhost/aluguel.procarbrasil.com.br');
				  
UPDATE wp_posts
SET post_content = REPLACE (post_content,
'src="https://aluguel.procarbrasil.com.br', 'src="http://localhost/aluguel.procarbrasil.com.br');
	
UPDATE wp_posts
SET guid = REPLACE (guid,
'https://aluguel.procarbrasil.com.br', 'http://localhost/aluguel.procarbrasil.com.br')
WHERE post_type = 'attachment';
				  
				  
-- 2019-03-12 13:07:24
