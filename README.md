# PostgreSQL E-Commerce Management System

A PostgreSQL-based E-Commerce Management System designed to practice and demonstrate relational database concepts, SQL queries, data manipulation, and table relationships.

## 📌 Project Overview

This project represents a basic e-commerce database containing customers, product categories, products, orders, order items, and payments.

The project focuses on practical SQL and PostgreSQL concepts used in real-world database systems.

## 🗄️ Database Schema

The database contains **6 tables**:

- `customers` — Stores customer information
- `categories` — Stores product categories
- `products` — Stores product details
- `orders` — Stores customer orders
- `order_items` — Stores products associated with each order
- `payments` — Stores payment information

### Table Relationships

```text
customers
    │
    └── orders
          │
          ├── order_items ── products ── categories
          │
          └── payments
```

## 🔑 Database Concepts Used

### Basic SQL
- SELECT
- WHERE
- AND / OR
- IN
- BETWEEN
- ORDER BY
- LIMIT
- DISTINCT

### Aggregate Functions
- COUNT()
- SUM()
- AVG()
- MAX()
- MIN()

### Grouping
- GROUP BY
- HAVING

### Joins
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- Multiple-table JOINs

### Advanced SQL Concepts
- Subqueries
- CASE statements
- NULL handling

### Data Manipulation
- INSERT
- UPDATE
- DELETE

## 📊 Example Queries

The project includes queries for:

- Finding products above a specific price
- Filtering customers by city
- Finding products with low stock
- Calculating average and maximum prices
- Grouping customers by city
- Finding order statistics by status
- Joining customers with their orders
- Joining products with categories
- Finding customers who have placed orders
- Finding customers who have not placed orders
- Categorizing products based on price
- Categorizing products based on stock
- Handling NULL values
- Performing CRUD operations

## 🛠️ Technologies Used

- **PostgreSQL**
- **SQL**
- **pgAdmin 4**

## 📁 Project Structure

```text
PostgreSQL-Ecommerce-Management-System/
│
├── ecommerce_management.sql
├── README.md
└── screenshots/
    ├── database.png
    └── queries.png
```

## 🚀 How to Run

1. Install PostgreSQL and pgAdmin 4.
2. Create a new PostgreSQL database.
3. Open **Query Tool** in pgAdmin.
4. Open `ecommerce_management.sql`.
5. Execute the SQL file.
6. The tables and sample data will be created.
7. Run the queries included in the file to explore the database.

## 🎯 Project Purpose

This project was created to strengthen practical understanding of:

- Relational databases
- Primary and foreign keys
- Table relationships
- SQL querying
- Data aggregation
- Database filtering
- JOIN operations
- Subqueries
- CRUD operations

## 👨‍💻 Author

**Taufique Hayat**

B.Tech CSE Student  
GitHub: https://github.com/taufiquehayat

---

⭐ If you find this project useful, feel free to star the repository.
