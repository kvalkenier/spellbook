{{
  config(
    schema = 'lending_gnosis',
    alias = 'base_borrow',
    materialized = 'view'
  )
}}

{%
  set models = [
    ref('agave_gnosis_base_borrow')
  ]
%}

{% for model in models %}
select
  blockchain,
  project,
  version,
  transaction_type,
  loan_type,
  token_address,
  borrower,
  repayer,
  liquidator,
  amount,
  block_month,
  block_time,
  block_number,
  tx_hash,
  evt_index
from {{ model }}
{% if not loop.last %}
union all
{% endif %}
{% endfor %}
