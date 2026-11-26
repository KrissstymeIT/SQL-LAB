USE company;

-- Task 4.1
SELECT *
FROM customer
ORDER BY last_name ASC;

-- Task 4.2
SELECT DISTINCT manufacture
FROM product
ORDER BY manufacture ASC;

-- Task 4.3
SELECT
    product_name,
    manufacture,
    category,
    product_type,
    price
FROM
    product
WHERE
    manufacture = 'DELL'
ORDER BY
    product_name ASC;

-- Task 4.4
SELECT
    first_name,
    last_name,
    gender,
    birth_date,
    phone_number
FROM
    customer
WHERE
    gender = 'F'
    AND birth_date BETWEEN '1990-01-01' AND '2000-12-31'
ORDER BY
    last_name ASC;

-- Task 4.5
SELECT *
FROM product
WHERE
    category = 'NOTEBOOK'
    AND amount > 0
    AND product_description LIKE '%512GB%';

-- Task 4.6
SELECT *
FROM product
WHERE
    amount > 0
    AND (category = 'NOTEBOOK' OR category = 'Desktops')
    AND (product_description LIKE '%512GB%' OR product_description LIKE '%1TB%');

-- Task 4.7
SELECT *
FROM invoice
WHERE
    customer_id IS NULL;
