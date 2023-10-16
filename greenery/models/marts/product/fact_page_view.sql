{{
    config(
        post_hook="{{ grant('reporting') }}"
    )
}}



with session_timing_agg as (
    select *
    from {{ ref('int_session_timing') }}
)


{% set event_types = dbt_utils.get_column_values(
    table=ref('stg_postgres_events'), 
    column='event_type'
    ) %}


select
    e.session_id,
    e.user_id,
    coalesce(e.product_id, oi.product_id) as product_id,
    session_started_at,
    session_ended_at,
    {% for event_type in event_types %}
    {{ sum_of('e.event_type', event_type) }} as {{ event_type }}s,
    {% endfor %}
    datediff('minute',session_started_at, session_ended_at) as session_length_minutes
from {{ ref('stg_postgres_events') }} e
left join {{ ref('stg_postgres_order_items') }} oi
    on oi.order_id = e.order_id
left join session_timing_agg s
    on s.session_id = e.session_id
group by all