SELECT 
    DISTINCT coalesce(product_category_name, 'outros')
    AS categoria_fillna
FROM
    tb_products
ORDER BY 
    product_category_name