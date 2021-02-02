CREATE OR REPLACE VIEW v_product_sale AS
SELECT P.name, P.category, P.price, P.inventory_amount AS inventory, SUM(O.quantity) AS quantity, SUM(O.quantity*P.price) AS sale
FROM itemSold I, product P
WHERE O.product_ID = P.ID
GROUP BY P.ID
ORDER BY sale DESC;

CREATE OR REPLACE VIEW v_category_sale AS
SELECT P.category, SUM(O.quantity) AS quantity, SUM(O.quantity*P.price) AS sale
FROM itemSold I, product P
WHERE O.product_ID = P.ID
GROUP BY P.category
ORDER BY sale DESC;

CREATE OR REPLACE VIEW v_region_sale AS
SELECT R.name AS region, R.manager_name AS manager, SUM(O.quantity*P.price) AS sale
FROM itemSold I, product P, transaction T, salesperson S, store ST, region R
WHERE O.transaction_ID = T.ID AND O.product_ID = P.ID AND T.salesperson_ID = S.ID AND S.store_ID = ST.ID AND ST.region_ID = R.ID
GROUP BY R.ID
ORDER BY sale DESC;

CREATE OR REPLACE VIEW v_store_sale AS
SELECT ST.ID AS store, ST.manager_name AS manager, SUM(O.quantity*P.price) AS sale
FROM itemSold I, product P, transaction T, salesperson S, store ST
WHERE O.transaction_ID = T.ID AND O.product_ID = P.ID AND T.salesperson_ID = S.ID AND S.store_ID = ST.ID
GROUP BY ST.ID
ORDER BY sale DESC;

CREATE OR REPLACE VIEW v_salesperson_sale AS
SELECT S.ID AS ID, S.name AS salesperson, SUM(O.quantity*P.price) AS sale
FROM itemSold I, product P, transaction T, salesperson S
WHERE O.transaction_ID = T.ID AND O.product_ID = P.ID AND T.salesperson_ID = S.ID
GROUP BY S.ID
ORDER BY sale DESC;

CREATE OR REPLACE VIEW v_customer_sale AS
SELECT C.ID AS ID, C.name AS customer, SUM(O.quantity*P.price) AS sale
FROM itemSold I, transaction T, customer C, product P
WHERE O.transaction_ID = T.ID AND O.product_ID = P.ID AND T.customer_ID = C.ID
GROUP BY C.ID
ORDER BY sale
