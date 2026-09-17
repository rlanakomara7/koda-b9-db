--EXERCISE 1
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price INT NOT NULL CHECK (price > 0)
);

INSERT INTO products (product_name, price)
VALUES ('Laptop', 1000), ('Mouse', 50), ('Keyboard', 200);

SELECT p1.product_name, p1.price
FROM products p1
WHERE price > (
    SELECT AVG(p2.price)
    FROM products p2
);

SELECT * FROM products;
------------------------------------------------------------------
--EXERCISE 2
CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    customer_id INT NOT NULL,
    amount INT NOT NULL CHECK (amount > 0)
);

INSERT INTO transactions(customer_id, amount)
VALUES (101,500), (101, 300), (102, 150);

SELECT 
    t1.transaction_id,
    t1.customer_id,
    t1.amount AS "nilai_transaksi"
FROM transactions t1
WHERE t1.amount > (
    SELECT AVG(t2.amount)
    FROM transactions t2
    WHERE t2.customer_id = t1.customer_id
);

SELECT * FROM transactions;

------------------------EXERCISE 3 CTE -----------------------------------
--------------------------------------------

CREATE TABLE sales (
    sale_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    product VARCHAR(100) NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    price_per_unit FLOAT NOT NULL CHECK (price_per_unit > 0.00),
    sale_date TIMESTAMP NOT NULL
);

INSERT INTO sales (customer_id, product, quantity, price_per_unit, sale_date)
VALUES
    (101, 'Keyboard', 2, 25.00, '2024-04-01'),
    (102, 'Mouse', 1, 15.00, '2024-04-01'),
    (101, 'Monitor', 1, 200.00, '2024-04-02'),
    (103, 'Keyboard', 1, 25.00, '2024-04-02'),
    (101, 'Mouse', 3, 15.00, '2024-04-03');

WITH sales_product AS (
    SELECT 
        customer_id,
        product,
        (quantity*price_per_unit) AS total_harga
    FROM sales
)

SELECT
    customer_id, 
    SUM(total_harga) AS total_harga_barang
FROM sales_product
WHERE product = 'Keyboard'
GROUP BY customer_id,product
HAVING SUM(total_harga) > 30 ;



-----------EXERCISE 4 CTE ---------------------------------------
---------------------------------------------------------------

WITH sales_1_product AS (
    SELECT product
    FROM sales
    GROUP BY product
    HAVING COUNT(*) = 1
)

SELECT 
    s.product,
    s.customer_id
FROM sales s
JOIN sales_1_product p ON s.product = p.product;




-----------EXERCISE 5 CTE ---------------------------------------
-----------------------------------------------------------------

--total penjualan = qty * price , buat subquery & cte

CREATE TABLE Products_Electronic (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price INT NOT NULL CHECK (price > 0)
); SELECT * FROM Products_Electronic;

CREATE TABLE Sales_Electronic (
    id SERIAL PRIMARY KEY,
    product_id INT REFERENCES Products_Electronic(id) NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0)
); SELECT * FROM sales_Electronic;

INSERT INTO Products_Electronic (name, price)
VALUES ('Laptop', 1000), ('Phone', 600), ('Tablet', 400);

INSERT INTO Sales_Electronic (product_id, quantity)
VALUES (1, 5), (2, 10), (3, 7), (1, 3);

---cte
WITH sales_over_7 AS (
    SELECT          
        p.id AS product_id,
        p.name AS name_product,
        p.price AS price_product,
        s.quantity AS quantity_product,
        (s.quantity*p.price) AS total_penjualan
    FROM Products_Electronic p
    JOIN Sales_Electronic s
    ON p.id = s.product_id
)

SELECT 
    product_id,
    name_product,
    SUM(quantity_product) AS TOTAL_TERJUAL,
    SUM(total_penjualan) AS NILAI_PENJUALAN
FROM sales_over_7
GROUP BY product_id, name_product
HAVING SUM(quantity_product) >= 7;

---subquery 

SELECT 
    p.id,
    p.name,
    p.price,
    SUM(s.quantity) AS total_qty,
    SUM(s.quantity*p.price) AS total_penjualan
FROM Products_Electronic p
JOIN Sales_Electronic s
ON p.id = s.product_id
WHERE p.id IN (
    SELECT s2.product_id
    FROM Sales_Electronic s2
    GROUP BY s2.product_id      
    HAVING SUM(s2.quantity) >= 7 
)
GROUP BY p.id, p.name, p.price;

