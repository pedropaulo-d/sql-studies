select 
    *
from 
(
    select 
        seller_state,
        count(*) as qtde_sellers
    from
        tb_sellers
      
    group by 
        seller_state
)
WHERE
    qtde_sellers > 10