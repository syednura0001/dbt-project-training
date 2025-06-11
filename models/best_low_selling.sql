with product_sales as(
select 
    productid, 
    sum(quantity) as total_sale
from {{ ref('orderitems_stg')}}
group by productid
),
sales_ranking as (
select 
    productid,
    total_sale,
    dense_rank() over(order by total_sale desc) as rank_desc,
    dense_rank() over(order by total_sale) as rank_asc
from product_sales
)
select 
    sr.productid, 
    p.name,
    (case 
        when rank_desc = 1 then 'Best selling'
        when rank_asc = 1 then 'Low selling'
        else null
    end) as sale_types
from sales_ranking sr
join {{ source("landing", "prdct") }} p
on sr.productid = p.productid
where sale_types is not null
