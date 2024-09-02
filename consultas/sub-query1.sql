/* 
Estudando formas de fazer subquerys - Forma 01
*/

SELECT
    t2.seller_state,
    t1.product_id,
    t3.product_category_name,
    SUM(t1.price) AS receita_total
FROM
    tb_order_items AS t1
LEFT JOIN 
    tb_sellers AS t2
    ON t1.seller_id = t2.seller_id
LEFT JOIN
    tb_products AS t3
    ON t1.product_id = t3.product_id
WHERE product_category_name IN (

    SELECT 
        t2.product_category_name
    FROM 
        tb_order_items AS t1
    LEFT JOIN 
        tb_products AS t2
    ON t1.product_id = t2.product_id
    GROUP BY 
        t2.product_category_name
    ORDER BY 
        COUNT(*) DESC
    LIMIT 3
)

GROUP BY t2.seller_state,
         t1.product_id,
         product_category_name;
