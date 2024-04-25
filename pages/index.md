---
title: Payment links dashboard
queries:
  - payment_link_raw: payment_link_raw.sql
  - payment_link_valuation_per_month: payment_link_valuation_per_month.sql
  - payment_link_valuation_total: payment_link_valuation_total.sql
  - payment_link_valuation_per_month_per_user: payment_link_valuation_per_month_per_user.sql
---

This demo connects to the hackathon Postgres DB.

<LineChart
  data={payment_link_valuation_per_month}
  y=volume_eur
  yFmt=eur
  title = "Payment link volume per month, EUR"
/>


```sql orders_by_month
select
  date_trunc('month', order_datetime) as order_month,
  count(*) as number_of_orders,
  sum(sales) as sales,
  sum(sales)/count(*) as average_order_value
from needful_things.orders
where order_datetime >= '2020-01-01'
group by 1 order by 1 desc
```

## Let's visualize data with components

### Current month KPIs

In the current month, users generated **<Value data={payment_link_valuation_per_month} column=number_of_payment_links/>** payment links.
The average payment link value is **<Value data={payment_link_valuation_per_month} column=average_payment_link_value fmt=eur2/>**.

### Total big values
<BigValue data={payment_link_valuation_total} value=volume_eur fmt=eur/>
<BigValue data={payment_link_valuation_total} value=number_of_payment_links/>
<BigValue data={payment_link_valuation_total} value=average_payment_link_value fmt=eur/>


### Total volume per month and per user

<BarChart 
    data={payment_link_valuation_per_month_per_user} 
    x=month 
    y=volume_eur 
    series=user_public_key 
    type=grouped
    labels=true
    >
    <ReferenceLine data={payment_link_valuation_total} y=average_payment_link_value label=average_valuation/>

</BarChart>


### Data Table

<DataTable data={payment_link_raw} rows=10/>