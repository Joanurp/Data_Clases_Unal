-- Listar la informacion del empleado con codigo 6
SELECT *
FROM employees
where employee_id = 6;

-- gerente de ventas desea listar todos los productos de precios inferior a 10

select *
FROM products
where unit_price < 10;

-- gerente de ventas desea listar todos los productos de precios superior a 10

select *
FROM products
where unit_price > 10;


-- menor o igual a 6

select *
FROM products
where unit_price <= 6;


-- mayor o igual a 9

select *
FROM products
where unit_price >= 6;

-- diferentes 

SELECT *
FROM employees
where employee_id <> 6;

--  Entre 

select *
FROM products
where unit_price BETWEEN  6 AND 50;

-- negacion 

select *
FROM products
where unit_price NOT BETWEEN  6 AND 50;

select *
FROM products
where unit_price > 20 OR unit_price < 6 OR product_id =5;

select *
FROM products
where unit_price > 20 OR unit_price < 6 OR product_id =5 OR  supplier_id=2;







