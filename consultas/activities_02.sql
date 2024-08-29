/*
Qual o valor total de receira gerada por clientes de cada estado?
Considere a base completa, com apenas pedidos entregues
*/

---------------------------------------------------

SELECT
    t2.customer_state,
    ROUND(SUM(t3.price), 3) AS receita_total_uf,
    ROUND(SUM(t3.price) / COUNT(DISTINCT t1.customer_id), 3) 
    AS avg_receita_cliente

FROM
    tb_orders AS t1
LEFT JOIN
    tb_customers AS t2 
    ON t1.customer_id = t2.customer_id
LEFT JOIN
    tb_order_items AS t3
    ON t1.order_id = t3.order_id
WHERE
    t1.order_status = 'delivered'
GROUP BY 
    t2.customer_state
ORDER BY
    SUM(t3.price) / COUNT(DISTINCT t1.customer_id) DESC;

---------------------------------------------------

/*
Qual o valor total de receira gerada por sellers de cada estado?
Considere a base completa, com apenas pedidos entregues
*/

SELECT
    t2.seller_state,
    ROUND(SUM(t1.price), 2) 
    AS receira_total_sellers,
    ROUND(SUM(t1.price) / COUNT(DISTINCT t2.seller_id), 2) 
    AS avg_receita_sellers,
    COUNT(DISTINCT t2.seller_id) 
    AS qtde_sellers
FROM
    tb_order_items AS t1
LEFT JOIN
    tb_sellers AS t2 
    ON t1.seller_id = t2.seller_id
LEFT JOIN
    tb_orders AS t3
    ON t1.order_id = t3.order_id
WHERE
    t3.order_status = 'delivered'
GROUP BY 
    t2.seller_state
ORDER BY
    SUM(t1.price) DESC;

---------------------------------------------------

/*
Qual o peso médio dos produtos vendidos por sellers de cada estado?
Considere apenas o ano de 2017 e pedidos entregues nesta análise.
*/

SELECT
    t2.seller_state AS sellers_uf,
    ROUND(AVG(t4.product_weight_g), 2) 
    AS avg_peso_produto
FROM
    tb_order_items AS t1
LEFT JOIN
    tb_sellers AS t2 
    ON t1.seller_id = t2.seller_id
LEFT JOIN
    tb_orders AS t3
    ON t1.order_id = t3.order_id
LEFT JOIN
    tb_products AS t4
    ON t1.product_id = t4.product_id
WHERE
    t3.order_status = 'delivered'
    AND CAST(strftime('%Y', t3.order_approved_at) AS INT) = 2017
GROUP BY 
    t2.seller_state
ORDER BY
    AVG(t4.product_weight_g) DESC;