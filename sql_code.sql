CREATE TABLE `customers` (
  `customer_id` integer PRIMARY KEY,
  `first_name` varchar(255),
  `last_name` varchar(255),
  `phone` varchar(255),
  `email` varchar(255),
  `street` varchar(255),
  `city` varchar(255),
  `state` varchar(255),
  `zip_code` integer
);

CREATE TABLE `orders` (
  `order_id` integer PRIMARY KEY,
  `customer_id` integer,
  `order_status` integer,
  `order_date` date,
  `required_date` date,
  `shipped_date` date,
  `store_id` integer,
  `staff_id` integer
);

CREATE TABLE `stores` (
  `store_id` integer PRIMARY KEY,
  `store_name` varchar(255),
  `phone` varchar(255),
  `email` varchar(255),
  `street` varchar(255),
  `city` varchar(255),
  `state` varchar(255),
  `zip_code` integer
);

CREATE TABLE `ordereditems` (
  `order_id` integer PRIMARY KEY,
  `item_id` integer,
  `product_id` integer,
  `quantity` integer,
  `list_price` float,
  `discount` float
);

CREATE TABLE `products` (
  `product_id` integer PRIMARY KEY,
  `product_name` varchar(255),
  `brand_id` integer,
  `category_id` integer,
  `model_year` integer,
  `list_price` float
);

CREATE TABLE `categories` (
  `category_id` integer PRIMARY KEY,
  `category_name` varchar(255)
);

CREATE TABLE `brands` (
  `brand_id` integer PRIMARY KEY,
  `brand_name` varchar(255)
);

ALTER TABLE `stores` ADD FOREIGN KEY (`store_id`) REFERENCES `orders` (`store_id`);

ALTER TABLE `ordereditems` ADD FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

ALTER TABLE `categories` ADD FOREIGN KEY (`category_id`) REFERENCES `products` (`category_id`);

ALTER TABLE `brands` ADD FOREIGN KEY (`brand_id`) REFERENCES `products` (`brand_id`);

ALTER TABLE `orders` ADD FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

ALTER TABLE `ordereditems` ADD FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
