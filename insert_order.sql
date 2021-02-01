INSERT INTO `transaction`
(`ID`, `date`, `customer_ID`, `salesperson_ID`, `payment_method`, `status`)
VALUES
('1', '2017-03-08', '1', '2', 'cash', 'received'),
('2', '2017-03-08', '3', '2', 'card', 'received'),
('3', '2017-03-10', '2', '3', 'card', 'received'),
('4', '2017-03-12', '9', '1', 'online', 'received'),
('5', '2017-03-13', '4', '4', 'card', 'received'),
('6', '2017-03-15', '10', '1', 'online', 'received'),
('7', '2017-03-20', '8', '1', 'online', 'received'),
('8', '2017-03-21', '7', '1', 'online', 'received'),
('9', '2017-03-22', '5', '7', 'cash', 'processing'),
('10', '2017-03-25', '3', '3', 'cash', 'processing');

UPDATE `beauty&beast`.transaction t
INNER JOIN(SELECT transaction_ID, SUM(sale) AS totalPrice 
		FROM `beauty&beast`.itemSold
        GROUP BY transaction_ID) AS Temp
ON t.ID = Temp.transaction_ID
SET payment_amount = Temp.totalPrice;


INSERT INTO `itemSold`
(`transaction_ID`, `product_ID`, `quantity`, `sale`)
VALUES
('1', '1', '1', '27.5'),
('1', '3', '1', '19.5'),
('2', '10', '1', '19'),
('3', '1', '1', '27.5'),
('3', '3', '1', '19.5'),
('3', '5', '1', '16'),
('4', '1', '10', '275'),
('4', '3', '10', '195'),
('4', '5', '10', '160'),
('5', '2', '1', '36'),
('5', '4', '1', '35'),
('5', '6', '1', '29'),
('6', '8', '10', '295'),
('6', '9', '5', '75'),
('6', '10', '5', '95'),
('7', '7', '1', '7'),
('7', '9', '1', '15'),
('8', '1', '1', '27.5'),
('8', '3', '1', '19.5'),
('8', '5', '1', '16'),
('9', '1', '1', '27.5'),
('9', '6', '1', '29'),
('10', '1', '1', '27.5'),
('10', '7', '1', '7')
