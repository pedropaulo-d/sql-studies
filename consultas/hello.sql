select
    product_category_name,
    count(*),
    max(product_weight_g) as maior_peso, -- maior
    min(product_weight_g) as menor_peso, -- menor
    avg(product_weight_g) as avg_peso -- média
FROM
    tb_products
WHERE 
    product_category_name is not null
    AND product_category_name != 'alimentos' -- diferença
    AND product_category_name <> 'agro_industria_e_comercio' -- diferença
GROUP by 
    product_category_name 