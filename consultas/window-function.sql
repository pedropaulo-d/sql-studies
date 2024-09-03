WITH tb_seller_product AS (
    SELECT seller_id,
    product_id,
    count(*) AS qtde_produto,
    sum(price) AS receita_produto

    FROM tb_orders AS t1

    LEFT JOIN tb_order_items AS t2
    ON t1.order_id = t2.order_id

    WHERE order_status = 'delivered'

    GROUP BY seller_id,
    product_id

    ORDER BY seller_id
),

tb_seller_max AS (
    SELECT seller_id,
        max(qtde_produto) AS max_qtde
    FROM tb_seller_product

    GROUP BY seller_id
)

SELECT t1.*,
    t2.*

FROM tb_seller_max AS t1

LEFT JOIN tb_seller_product AS t2
ON t1.seller_id = t2.seller_id 
AND t1.max_qtde = t2.qtde_produto