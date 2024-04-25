select
  count(*) as number_of_payment_links,
  sum(valuation_eur) as volume_eur,
  sum(valuation_eur)/count(*) as average_payment_link_value
from ${payment_link_raw}