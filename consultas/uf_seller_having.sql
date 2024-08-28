select 
    seller_state,
    count(*) as qtde_sellers
from
    tb_sellers
-- filtro pré agg (agregação)
where
    seller_state in ('SP', 'RJ', 'PR')
-- agregação
group by 
    seller_state
-- filtro pós agg (agregação)
having 
    count(*) > 10