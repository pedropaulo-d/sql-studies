---------------------------------------------------

SELECT 
    product_category_name,
    avg(product_description_lenght) AS media_description_lenght,
    max(product_description_lenght) AS max_description_lenght,
    min(product_description_lenght) AS min_description_lenght
FROM 
    tb_products
GROUP BY
    product_category_name;

---------------------------------------------------

SELECT 
    *
FROM 
    tb_products;

---------------------------------------------------

SELECT 
    product_category_name,
    avg(product_name_lenght) AS media_name_lenght,
    max(product_name_lenght) AS max_name_lenght,
    min(product_name_lenght) AS min_name_lenght
FROM 
    tb_products
WHERE
    product_description_lenght > 100
GROUP BY
    product_category_name
HAVING 
    avg(product_description_lenght) > 500
ORDER BY min(product_name_lenght) desc,
         max(product_name_lenght) asc;