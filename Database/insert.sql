INSERT INTO `product`
(`ID`, `name`, `inventory_amount`, `category`, `price`, `active`)
VALUES
('1', 'Ultra Facial Cream', '1000', ' moisturizers', '27.5', '1'),
('2', 'Facial Fuel Anti-Wrinkle Cream', '1000', ' moisturizer', '36', '1'),
('3', 'Ultra Facial Cleanser', '1000', 'cleanser', '19.5', '1'),
('4', 'Calendula Herbal Extract Alcohol-Free Toner', '1000', 'toner', '35', '1'),
('5', 'Ultra Facial Toner', '1000', 'toner', '16', '1'),
('6', 'Creamy Eye Treatment with Avocado', '1000', 'eye care', '29', '1'),
('7', 'Lip Balm #1', '1000', 'lip care', '7', '1'),
('8', 'Creme de Corps', '1000', 'body', '29.5', '1'),
('9', 'Ultimate Strength Hand Salve', '1000', 'hand&foot', '15', '1'),
('10', 'Amino Acid Shampoo', '1000', 'hair', '19', '1');

INSERT INTO `region`
(`ID`, `name`, `manager_name`)
VALUES
('1', 'Online', 'Ann Smith'),
('2', 'PA', 'Jim White'),
('3', 'OH', 'Aya Snow');

INSERT INTO `store`
(`ID`, `address_street`, `address_city`, `address_state`, `address_zip`, `manager_name`, `salesperson_amount`, `region_ID`)
VALUES
('1', '223 Mulberry Street', 'New York City', 'NY', '10012', 'Ann Smith', '1', '1'),
('2', '5500 Walnut Street', 'Pittsburgh', 'PA', '15232', 'Jim White', '2', '2'),
('3', '1000 Ross Park Mall', 'Pittsburgh', 'PA', '15237', 'Jane Rain', '2', '2'),
('4', '1350 Polaris Parkway', 'Columbus', 'OH', '43240', 'Aya Snow', '2', '3');

INSERT INTO `salesperson`
(`ID`, `name`, `address_street`, `address_city`, `address_state`, `address_zip`, `email`, `password`, `job_title`, `salary`, `store_ID`)
VALUES
('1', 'Ann Smith', '122 North Ave', 'New York City', 'NY', '10020', 'ann@123.net', '123', 'manager', '8000', '1'),
('2', 'Jim White', '555 Adwood Street', 'Pittsburgh', 'PA', '15217', 'jim@123.net', '123', 'manager', '7000', '2'),
('3', 'Brandy Sea', '23 Morewood Street', 'Pittsburgh', 'PA', '15217', 'bsea@123.net', '123', 'staff', '5000', '2'),
('4', 'Jane Rain', '22 Smallman Street', 'Pittsburgh', 'PA', '15206', 'jr@123.net', '123', 'manager', '7000', '3'),
('5', 'Cindy X', '67 Mcnight Ave', 'Pittsburgh', 'PA', '15236', 'cindy@123.net', '123', 'staff', '5000', '3'),
('6', 'Aya Snow', '28 South Ave', 'Columbus', 'OH', '43240', 'aya@123.net', '123', 'manager', '6500', '4'),
('7', 'Elle Wang', '543 Liberty Ave', 'Columbus', 'OH', '43243', 'elle@123.net', '123', 'intern', '4000', '4');

INSERT INTO `customer`
(`ID`, `name`, `address_street`, `address_city`, `address_state`, `address_zip`, `type`, `email`, `password`)
VALUES
('1', 'Susan Herse', '35 Shady Ave', 'Pittsburgh', 'PA', '15217', 'home', 'susan@gmail.com', '123'),
('2', 'Michael Ken', '55 Oakland Ave', 'Pittsburgh', 'PA', '15213', 'home', 'ken@gmail.com', '123'),
('3', 'Lisa Will', '33 Fifth Ave', 'Pittsburgh', 'PA', '15237', 'home', 'lisa@gmail.com', '123'),
('4', 'Mike Bay', '32 North Park Street', 'Pittsburgh', 'PA', '15243', 'home', 'mike@gmail.com', '123'),
('5', 'Wendy Wu', '55 Fifth Street', 'Columbus', 'OH', '43234', 'home', 'wendy@gmail.com', '123'),
('6', 'Gina Finn', '567 East End Street', 'Columbus', 'OH', '43240', 'home', 'gina@gmail.com', '123'),
('7', 'Helen Gyn', '345 East Street', 'Phoenix', 'AZ', '85016', 'home', 'gyn@gmail.com', '123'),
('8', 'Moon Rise', '1 First Street', 'Salt Lake City', 'UT', '84150', 'home', 'moon@gmail.com', '123'),
('9', 'Lu La La', 'San Diego', '88 Eighth Ave', 'CA', '92134', 'business', 'service@lulala@net', '123'),
('10', 'For U', '37 Ryn Street', 'San Jose', 'CA', '95103', 'business', 'foryou@gmail.com', '123');

INSERT INTO `customer_home`
(`customer_ID`, `marriage`, `gender`, `age`, `income`)
VALUES
('1', 'no', 'female', '22', '20000'),
('2', 'no', 'female', '21', '15000'),
('3', 'no', 'female', '28', '80000'),
('4', 'yes', 'male', '35', '180000'),
('5', 'yes', 'female', '30', '100000'),
('6', 'no', 'female', '24', '100000'),
('7', 'no', 'female', '22', '70000'),
('8', 'no', 'female', '23', '50000');

INSERT INTO `customer_business`
(`customer_ID`, `category`, `business_volume`)
VALUES
('9', 'beauty', '200000'),
('10', 'beauty', '150000')
