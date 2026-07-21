-- [Bài tập] Thống kê Doanh thu
-- Thêm một đơn hàng mới vào bảng orders và chi tiết của đơn hàng đó vào bảng order_details.
INSERT INTO orders (order_id, order_date, customer_id)
VALUES
(1, '2026-07-21', 1);
INSERT INTO products (product_id, product_name, price, category_id)
VALUES
(3, 'Samsung Tablet', 8000000, 3);
INSERT INTO order_details (order_id, product_id, price, quantity)
VALUES
(1, 2, 23000000, 1),
(1, 3, 8000000, 2);
-- Tính tổng doanh thu của toàn bộ cửa hàng.
SELECT 
    SUM(price * quantity) AS total_revenue
FROM order_details;
-- Tính doanh thu trung bình của mỗi đơn hàng.
SELECT 
    AVG(order_revenue) AS average_order_revenue
FROM
(
    SELECT 
        order_id,
        SUM(price * quantity) AS order_revenue
    FROM order_details
    GROUP BY order_id
) AS order_total;
-- Tìm và hiển thị thông tin của đơn hàng có doanh thu cao nhất.
SELECT 
    order_id,
    SUM(price * quantity) AS order_revenue
FROM order_details
GROUP BY order_id
ORDER BY order_revenue DESC
LIMIT 1;
-- Tìm và hiển thị danh sách 3 sản phẩm bán chạy nhất dựa trên tổng số lượng đã bán.
SELECT
    product_id,
    SUM(quantity) AS total_sold
FROM order_details
GROUP BY product_id
ORDER BY total_sold DESC
LIMIT 3;