with date_spine as (
    {{ dbt_utils.date_spine(
        datepart="day",
        start_date="cast('2016-01-01' as date)",
        end_date="cast('2019-01-01' as date)"
    ) }}
)

select
    date_day as date_id,
    extract(year from date_day) as year,
    extract(month from date_day) as month,
    extract(week from date_day) as week_of_year,
    extract(dayofweek from date_day) as day_of_week,
    format_date('%Y-%m', date_day) as year_month
from date_spine