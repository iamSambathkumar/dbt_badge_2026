{% snapshot orders_snapshot %}

{{
    config(
      unique_key='order_id',
      strategy='check',
      check_cols=['order_id','customer_id','order_date','status'],
      hard_deletes='ignore'
    )
}}

select * from {{ source('jaffle_shop','orders') }}

{% endsnapshot %}