-- [Bài tập] Truy vấn tổng hợp cho hệ thống bán hàng
-- Liệt kê sản phẩm cùng với tên danh mục tương ứng.
SELECT
    p.product_id,
    p.product_name,
    c.category_name
FROM products p
JOIN categories c
ON p.category_id = c.category_id;
-- Đếm số đơn hàng của từng khách hàng.
SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY 
    c.customer_id,
    c.customer_name;
-- Xác định 5 khách hàng có tổng doanh thu chi tiêu cao nhất.
SELECT
    c.customer_id,
    c.customer_name,
    SUM(od.price * od.quantity) AS total_spent
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_details od
ON o.order_id = od.order_id
GROUP BY
    c.customer_id,
    c.customer_name
ORDER BY total_spent DESC
LIMIT 5;
-- Tìm các sản phẩm chưa từng xuất hiện trong bất kỳ đơn hàng nào.
SELECT
    p.product_id,
    p.product_name
FROM products p
LEFT JOIN order_details od
ON p.product_id = od.product_id
WHERE od.product_id IS NULL;
-- Tìm những khách hàng đã mua sản phẩm thuộc danh mục có số lượng sản phẩm lớn nhất.
INSERT INTO order_details (order_id, product_id, price, quantity)
VALUES
(1, 1, 15000000, 1);
SELECT
    category_id,
    COUNT(*) AS total_products
FROM products
GROUP BY category_id
ORDER BY total_products DESC
LIMIT 1;
SELECT DISTINCT
    c.customer_id,
    c.customer_name
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_details od
ON o.order_id = od.order_id
JOIN products p
ON od.product_id = p.product_id
WHERE p.category_id = 
(
    SELECT category_id
    FROM products
    GROUP BY category_id
    ORDER BY COUNT(*) DESC
    LIMIT 1
);