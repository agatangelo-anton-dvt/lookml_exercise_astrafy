view: order_segmentation {
  derived_table: {
  datagroup_trigger: astrafy_project_default_datagroup
    sql: 
      WITH history AS (
          SELECT
              orders_id,
              customers_id,
              date_date,
              COUNT(orders_id) OVER (
                  PARTITION BY customers_id 
                  ORDER BY UNIX_DATE(date_date) 
                  RANGE BETWEEN 365 PRECEDING AND 1 PRECEDING
              ) as orders_last_12_months
          FROM `raw_data.orders_reclutement`
      )
      SELECT
          orders_id,
          customers_id,
          date_date,
          CASE 
              WHEN orders_last_12_months = 0 THEN 'New'
              WHEN orders_last_12_months BETWEEN 1 AND 3 THEN 'Returning'
              WHEN orders_last_12_months >= 4 THEN 'VIP'
          END as segment
      FROM history
      WHERE extract(YEAR FROM date_date) = 2023 ;;
  }

  dimension: orders_id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.orders_id ;;
  }

  dimension: segment {
    type: string
    label: "Order Segment (2023)"
    description: "Segmentation: New (0), Returning (1-3), VIP (4+) in the last 12 months"
    sql: ${TABLE}.segment ;;
  }
}
