-- [Bài tập] Tìm kiếm sản phẩm nâng cao

-- Tìm các sản phẩm có giá nằm trong một khoảng cụ thể
SELECT *
FROM products
WHERE price BETWEEN 5000000 AND 15000000;
-- Tìm các sản phẩm có tên chứa một chuỗi ký tự nhất định
SELECT *
FROM products
WHERE product_name LIKE '%phone%';
-- Tính giá trung bình của sản phẩm cho mỗi danh mục
SELECT 
    category_id,
    AVG(price) AS average_price
FROM products
GROUP BY category_id;
-- Tìm những sản phẩm có giá cao hơn mức giá trung bình của toàn bộ sản phẩm
SELECT *
FROM products
WHERE price > (
    SELECT AVG(price)
    FROM products
);
-- Tìm sản phẩm có giá thấp nhất cho từng danh mục
SELECT 
    category_id,
    MIN(price) AS lowest_price
FROM products
GROUP BY category_id;