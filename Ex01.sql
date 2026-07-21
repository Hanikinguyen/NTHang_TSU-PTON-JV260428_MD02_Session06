CREATE DATABASE session06;
USE session06;

-- [Bài tập] Quản lý sản phẩm & danh mục
CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(255)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    price double,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);
-- Thêm 3 sản phẩm mới vào bảng products
INSERT INTO categories(category_id, category_name)
VALUES
(1,'Laptop'),
(2,'Phone'),
(3,'Tablet');
INSERT INTO products (product_id, product_name, price, category_id)
VALUES
(1, 'Laptop Dell', 15000000, 1),
(2, 'iPhone 15', 25000000, 2),
(3, 'Samsung Tablet', 8000000, 3);
-- Cập nhật giá của một sản phẩm đã có
UPDATE products
SET price = 23000000
WHERE product_id = 2;
-- Xóa một sản phẩm
DELETE FROM products
WHERE product_id = 3;
-- Hiển thị tất cả sản phẩm, sắp xếp theo giá
SELECT *
FROM products
ORDER BY price ASC;
-- Thống kê số lượng sản phẩm cho từng danh mục
SELECT 
    category_id,
    COUNT(*) AS total_products
FROM products
GROUP BY category_id;
