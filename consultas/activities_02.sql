/*
Qual o valor total de receira gerada por clientes de cada estado?
Considere a base completa, com apenas pedidos entregues
*/

---------------------------------------------------

SELECT
    DISTINCT t1.customer_id AS clientes,
    SUM(t3.payment_value) AS receita_por_cliente,
    t2.customer_state
FROM
    tb_orders AS t1
LEFT JOIN
    tb_customers AS t2 
    ON t1.customer_id = t2.customer_id
LEFT JOIN
    tb_order_payments AS t3
    ON t1.order_id = t3.order_id
WHERE
    t1.order_status = 'delivered'
GROUP BY 
    t1.customer_id
ORDER BY
    SUM(t3.payment_value) DESC

---------------------------------------------------

/*
Qual o valor total de receira gerada por sellers de cada estado?
Considere a base completa, com apenas pedidos entregues
*/

SELECT
    DISTINCT t2.seller_id AS vendedor,
    ROUND(SUM(t1.freight_value + t1.price), 2) AS receira_por_vendedor,
    t2.seller_state
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
    t2.seller_id
ORDER BY
    SUM(t1.freight_value + t1.price) DESC

---------------------------------------------------

select * from tb_products -- peso product_weight_g (ta em gramas)
select * from tb_sellers -- sellers e uf_estado
select * from tb_orders -- status do pedido e ano
select * from tb_order_items -- order_id e seller_id

/*
Qual o peso médio dos produtos vendidos por sellers de cada estado?
Considere apenas o ano de 2017 e pedidos entregues nesta análise.
*/

SELECT
    DISTINCT t2.seller_id AS vendedor,
    ROUND(AVG(t4.product_weight_g), 2) AS avg_peso_produtos,
    t2.seller_state
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
    t2.seller_id
ORDER BY
    AVG(t4.product_weight_g) DESC