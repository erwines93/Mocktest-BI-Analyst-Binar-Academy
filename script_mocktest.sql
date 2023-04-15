use mocktest_bianalyst;
SELECT * FROM mocktest_bianalyst.orders;

# BI Engineer SQL Test #2
# 1. Jumlah seluruh produk yang terjua
select sum(quantity) as jumlah_produk_terjual from orders;

# 2. Jumlah unique customer yang telah memesan produk
select count(Order_ID) as order_unique_customer from orders;

# 3. Rata-rata profit dari seluruh order (dalam mata uang)
select avg(sales) as rata2_sales from orders;

# 4. Berapa discount terkecil dari seluruh order
select min(discount) as min_disc from orders;

# 5. Jumlah seluruh produk dari kategori Furniture
select count(*) as jumlah_barang_furniture from categories where Category='Furniture';

# 6. Nama pelanggan yang membeli produk paling banyak (dalam quantity)
SELECT * From orders WHERE Quantity = (SELECT MAX(Quantity) AS Order_Terbanyak FROM orders);

# 7. Nama pelanggan yang paling sering melakukan repeat order
SELECT product_id, COUNT(*) repeat_order FROM orders GROUP BY product_id HAVING COUNT(product_id)  > 1;

# 8. Dari kota mana pelanggan yang paling sering melakukan repeat order
SELECT city, COUNT(*) repeat_order FROM orders GROUP BY city HAVING COUNT(city)  > 1;

# 9. Order mana yang mendapatkan total discount paling kecil
select order_id, min(discount) as min_disc from orders group by order_id;

# 10. Total profit yang datang dari produk dengan sub category Furnishings & Supplies
SELECT Orders.Product_ID, categories.Sub_category, Orders.Profit FROM Orders INNER JOIN Categories ON 
Orders.Product_ID=Categories.Product_ID where categories.sub_category in ('furnishings', 'supplies') order by orders.product_id;
SELECT sum(Orders.PROFIT) FROM Orders INNER JOIN Categories ON 
Orders.Product_ID=Categories.Product_ID where categories.product_name like 'black%' order by orders.product_id;

# 11. Jumlah order yang berasal dari produk warna hitam (terdapat keterangan “black” di nama produknya)
SELECT Orders.Product_ID, categories.product_name, Orders.quantity FROM Orders INNER JOIN Categories ON 
Orders.Product_ID=Categories.Product_ID where categories.product_name like 'black%' order by orders.product_id;
SELECT sum(Orders.quantity) FROM Orders INNER JOIN Categories ON 
Orders.Product_ID=Categories.Product_ID where categories.product_name like 'black%' order by orders.product_id;

# 12. .Jumlah order yang memiliki waktu pengiriman masih di hari yang sama dengan waktu pemesanan
select order_date, ship_date, quantity from orders where order_date = ship_date;
select sum(quantity) from orders where order_date = ship_date;

# BI Engineer SQL Test #2 (Opsional)
SELECT first_name, last_name, salary FROM employees order by max(employee.salary);

