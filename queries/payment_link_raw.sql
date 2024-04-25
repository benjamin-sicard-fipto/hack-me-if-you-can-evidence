with source as (

  select
  u.public_key as user_public_key,
  pl.asset_code as asset,
  pl.amount,
  pl.amount * p.price as valuation_eur,
  pl.status,
  pl.reference,
  pl.created_at
  from
  postgres_hackathon.payment_link pl
  left join postgres_hackathon.users u on pl.created_by = u.user_id
  left join prices.prices p on pl.asset_code = p.base_asset

)

select * from source