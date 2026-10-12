select current_database();
select * from customers;
select * from categories;
select * from orders;
select * from products;
select * from order_items;
select * from payments;

create table customers(customer_id int generated always as IDENTITY primary key,
name varchar(30) not null,email varchar(30) unique not null,phone varchar(40) unique not null,
city varchar(40) not null,created_at date not null);

create table categories(category_id int generated always as IDENTITY primary key,
category_name varchar(40) unique not null);

create table products(product_id int generated always as IDENTITY primary key,category_id int, 
foreign key(category_id) references categories(category_id), product_name varchar(40) not null,
price decimal(10,3) not null, stock int not null,brand_name varchar(40));

create table orders(order_id int generated always as IDENTITY primary key,customer_id int,
foreign key(customer_id) references customers(customer_id),order_date date not null,status 
varchar(40) not null,total_amount decimal(10,3) );

create table order_items(orderItem_id int generated always as IDENTITY primary key,
order_id int, foreign key(order_id) references orders(order_id),product_id int, foreign key(product_id)
references products(product_id),quantity int, price decimal(10,3) not null);

create table payments(payment_id int generated always as IDEntity primary key,
order_id int,foreign key(order_id) references orders(order_id),payment_mode varchar(40) not null, status varchar(40) not null,payment_date
date not null)

INSERT INTO categories (category_name)
VALUES
('Electronics'),
('Clothing'),
('Books'),
('Grocery'),
('Sports'),
('Home Appliances');

INSERT INTO customers (name, email, phone, city, created_at)
VALUES
('Taufique', 'taufique@gmail.com', '9876543210', 'Patna', '2026-09-01'),
('Rahul', 'rahul@gmail.com', '9876543211', 'Delhi', '2026-09-02'),
('Aman', 'aman@gmail.com', '9876543212', 'Mumbai', '2026-09-03'),
('Priya', 'priya@gmail.com', '9876543213', 'Kolkata', '2026-09-04'),
('Neha', 'neha@gmail.com', '9876543214', 'Patna', '2026-09-05'),
('Arjun', 'arjun@gmail.com', '9876543215', 'Bangalore', '2026-09-06'),
('Sahil', 'sahil@gmail.com', '9876543216', 'Delhi', '2026-09-07'),
('Anjali', 'anjali@gmail.com', '9876543217', 'Ranchi', '2026-09-08');

INSERT INTO products
(category_id, product_name, price, stock, brand_name)
VALUES
(1, 'Wireless Mouse', 599.99, 50, 'Logitech'),
(1, 'Keyboard', 1299.99, 35, 'HP'),
(1, 'Bluetooth Speaker', 2499.99, 20, 'JBL'),
(2, 'T-Shirt', 799.99, 60, 'Puma'),
(2, 'Jeans', 1499.99, 40, 'Levis'),
(3, 'Python Programming Book', 699.99, 25, 'OReilly'),
(3, 'Database System Book', 899.99, 15, 'Pearson'),
(4, 'Rice 5kg', 450.00, 30, 'India Gate'),
(5, 'Cricket Bat', 2999.99, 10, 'SS'),
(6, 'Electric Kettle', 1199.99, 18, 'Philips');

INSERT INTO orders
(customer_id, order_date, status, total_amount)
VALUES
(1, '2026-09-10', 'Delivered', 1899.98),
(2, '2026-09-11', 'Pending', 2499.99),
(3, '2026-09-12', 'Delivered', 799.99),
(4, '2026-09-13', 'Cancelled', 1499.99),
(5, '2026-09-14', 'Delivered', 2999.99),
(6, '2026-09-15', 'Pending', 1199.99),
(7, '2026-09-16', 'Delivered', 1599.98),
(8, '2026-09-17', 'Shipped', 699.99);

INSERT INTO order_items
(order_id, product_id, quantity, price)
VALUES
(1, 1, 1, 599.99),
(1, 2, 1, 1299.99),
(2, 3, 1, 2499.99),
(3, 4, 1, 799.99),
(4, 5, 1, 1499.99),
(5, 9, 1, 2999.99),
(6, 10, 1, 1199.99),
(7, 6, 1, 699.99),
(7, 2, 1, 900.00),
(8, 6, 1, 699.99);


INSERT INTO payments
(order_id, payment_mode, status, payment_date)
VALUES
(1, 'UPI', 'Paid', '2026-09-10'),
(2, 'Card', 'Pending', '2026-09-11'),
(3, 'UPI', 'Paid', '2026-09-12'),
(4, 'Card', 'Failed', '2026-09-13'),
(5, 'COD', 'Paid', '2026-09-14'),
(6, 'UPI', 'Pending', '2026-09-15'),
(7, 'Card', 'Paid', '2026-09-16'),
(8, 'UPI', 'Paid', '2026-09-17');

select * from customers;
select name,city from customers;
select product_name,price,brand_name from products;
select order_id , status , total_amount from orders;


select * from  customers where city='Patna';
select * from  products where price>1000;
select * from  orders where status='Delivered';
select * from customers where city in ('Patna');
select * from products where stock<20;

select * from customers where city='Patna' and email='taufiquehayat@gmail.com';
select * from products where price > 1000 and stock < 30;

select * from customers where city='Delhi' or city='Mumbai';
select * from products where category_id=1 or category_id=3;

select * from customers where city in ('Patna','Delhi','Mumbai');
select * from products where category_id in (1,3,5);

select * from products where price between 	500 and 1500;
select * from orders where total_amount between 1000 and 2500;

select * from products order by price desc;
select * from products order by price asc;

select * from products order by price desc limit 3;
select * from customers order by customer_id asc limit 5;

select count(product_id) from products;
select max(price)  from products;
select avg(price)  from products;
select sum(stock) from products;
select sum(total_amount) from orders;
select min(price) from products;
select min(total_amount) from orders;
select  DISTINCT city from customers;
select distinct brand_name from products;

select city, count(customer_id) from customers group by city;
select status, count(order_id) from orders group by status;
select category_id, count(product_id) from products group by category_id;
select payment_mode,count(payment_id) from payments group by payment_mode;
select category_id, sum(stock) from products group by category_id;
select status, sum(total_amount) from orders group by status;
select category_id,avg(price) from products group by category_id;
select status,avg(total_amount) from orders group by status;

select city from customers group by city having count(customer_id)>2;
select status from orders group by status having avg(total_amount)>1500;


select name,order_id,total_amount from customers as a
join orders as b
on a.customer_id=b.customer_id;

select product_name,category_name from products as a
join categories as b
on a.category_id=b.category_id;

select a.order_id,a.total_amount,b.payment_mode,b.status from orders as a
join payments as b
on a.order_id=b.order_id;

select product_name,quantity,a.price,b.price from order_items as a
join products as b
on a.product_id=b.product_id;

select name,order_id,total_amount,status from customers as a
join orders as b
on a.customer_id=b.customer_id where status='Delivered';

select product_name, price,category_name from products as a
join categories as b
on b.category_id=a.category_id where category_name='Electronics';

select name, order_id,total_amount from customers as a
join orders as b
on a.customer_id=b.customer_id order by total_amount asc;

select product_name, a.price, category_name from products as a
join categories as b
on a.category_id = b.category_id order by price desc limit 3

select name,order_id from customers as a
left join orders as b
on a.customer_id=b.customer_id;

select * from categories as a
left join products as b
on a.category_id=b.category_id;

select name,order_id,total_amount from customers as a
left join orders as b
on a.customer_id=b.customer_id;

select a.category_name from categories as a
left join products as b
on a.category_id=b.category_id where b.product_id is null;


select name,order_id from customers as a
right join orders as b
on a.customer_id=b.customer_id;

select product_name,category_name from categories as a
right join products as b
on a.category_id=b.category_id;

select payment_id,a.order_id,payment_mode,total_amount from orders as a
right join payments as b
on a.order_id = b.order_id;

select a.name,b.order_id,b.total_amount,c.payment_mode from customers as a
join orders as b 
on a.customer_id=b.customer_id 
join  payments as c on b.order_id=c.order_id;

select a.product_name,category_name,quantity from products as a
join categories as b 
on a.category_id=b.category_id
join order_items as c on  a.product_id=c.product_id;

select a.name,b.order_id,c.quantity from customers as a
join orders as b
on a.customer_id=b.customer_id
join order_items as c
on b.order_id=c.order_id;

select a.name ,b.order_id, b.total_amount, c.payment_mode, c.status from customers as a
join orders as b on a.customer_id=b.customer_id
join payments as c on b.order_id=c.order_id where b.status='Delivered' and c.status='Paid';


select avg(price) from products;
select product_name,price from products where price > (select avg(price) from products);

select avg(total_amount) from orders;
select order_id,customer_id,total_amount from orders where total_amount >(select avg(total_amount) from orders);

select max(price) from products;
select product_name,price from products where price = (select max(price) from products);

select customer_id from orders;
select name,customer_id from customers where customer_id in (select customer_id from orders);

select * from customers where city in ('Delhi','Patna');
select name,city from customers where city in ('Delhi','Patna') and customer_id in (select customer_id from orders);

select customer_id from orders;
select name,customer_id from customers where customer_id not in (select customer_id from orders);

select max(total_amount) from orders;
select order_id,customer_id,total_amount from orders where total_amount = (select max(total_amount) from orders);

SELECT product_name, price,
       CASE
           WHEN price >= 2000 THEN 'Expensive'
           WHEN price >= 1000 THEN 'Medium'
           ELSE 'Cheap'
       END AS price_category
FROM products;

select product_name,stock,
		case
			when stock=0 then 'Out of stock'
			when stock<20 then 'Low stock'
			else 'Avliable'
			end as stock_status
from products;

select order_id,status,
	case
		when status='Delivered' then 'Completed'
		when status='Pending' then 'waiting'
		when status='Cancelled' then 'Failed'
		else 'others'
	end as category_status
from orders;
			
select product_name,brand_name from products where brand_name IS NUll;				
select product_name,brand_name from products where brand_name IS NOT NUll;	
select name,email from customers where email is not null;
select product_name,brand_name,stock from products where stock=0 or brand_name is null;


insert into products(category_id,product_name,price,stock,brand_name) values
(6,'smart_cooler',3499.00,0,'uma');

update  products
set stock=1
where brand_name='SS';

delete from products
where product_name='smart_cooler';

--STRINGS
select student_id,concat(student_name,' = ',email) from students;	--conactenation
select substr('tauf@gmail.com',5,6) from students;   				--substring--
select length(email) from students; 								--length--
select replace(email,'tauf','hayat') from students; 				--Replace--
select reverse('tauf@gmail.com') from students;     				--reverse--
select lower(email) from students; 									--lower
select upper(email) from students;									--upper
select left(email,7) from students; 								--left
select right('tauf@gmail.com',7) from students; 					--right
select trim(email) from students;									--Trim
