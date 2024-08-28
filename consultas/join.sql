/*
qual a receita de cada categoria de produto?
e o total de vendas?
em unidades e em pedidos?
select * from tb_products/ -- tabela de produtos
select * from tb_orders; -- tabela de vendas
*/


SELECT
    t2.product_category_name,
    ROUND(SUM(t1.price), 2) AS receita,
    COUNT(*) AS total_itens_vendidos,
    COUNT(DISTINCT t1.order_id) AS qtde_pedidos,
    ROUND(COUNT(*) / CAST(COUNT(DISTINCT t1.order_id) AS FLOAT), 2) 
    AS avg_item_por_pedido
FROM 
    tb_order_items AS t1
LEFT JOIN 
    tb_products AS t2 
    ON t1.product_id = t2.product_id
LEFT JOIN
    tb_orders AS t3
    ON t1.order_id = t3.order_id
WHERE
    t3.order_status = 'delivered'
    AND CAST(strftime('%Y', t3.order_approved_at) AS INT) = 2017
GROUP BY 
    t2.product_category_name
ORDER BY 
    COUNT(*) / CAST(COUNT(DISTINCT t1.order_id) AS FLOAT) DESC

