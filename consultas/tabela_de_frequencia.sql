with tb_freq as (
    
    select seller_state,
        count(*) AS freqAbsoluta
    from tb_sellers 
    group by seller_state

)

select *,
    freqAbsoluta / (select sum(freqAbsoluta) * 1.0 from tb_freq) as freqRelativa,
    sum(freqAbsoluta / (select sum(freqAbsoluta) * 1.0 from tb_freq)) OVER (order by freqAbsoluta desc) as freqRelativaAcumulada
from tb_freq;
