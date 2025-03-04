{% set blockchain = 'optimism' %}

{{
    config(
        schema='balancer_v2_' + blockchain,
        alias = 'bpt_supply',
        materialized = 'table',
        file_format = 'delta'
    )
}}

{{ 
    balancer_bpt_supply_macro(
        blockchain = blockchain,
        version = '2'
    )
}}