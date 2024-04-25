select
  date_trunc('month', created_at) as month,
  user_public_key,
  count(*) as number_of_payment_links,
  sum(valuation_eur) as volume_eur,
  sum(valuation_eur)/count(*) as average_payment_link_value
from ${payment_link_raw}
group by 1, 2 order by 1 desc