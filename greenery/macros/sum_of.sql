{%- macro sum_of(col_name, col_value) -%}

sum(case when {{ col_value }} = '{{ col_value }}' then 1 els o end)

{%- endmacro -%}