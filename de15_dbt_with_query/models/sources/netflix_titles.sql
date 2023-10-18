{{
    config(
        materialized='ephemeral'
    )
}}

SELECT
    * EXCEPT(
        date_added
    ),
    CASE
        WHEN date_added <> "" THEN PARSE_DATE("%B %d, %Y", date_added)
        ELSE null
    END AS date_added
FROM
    {{ source('playground', 'raw_netflix_titles') }}