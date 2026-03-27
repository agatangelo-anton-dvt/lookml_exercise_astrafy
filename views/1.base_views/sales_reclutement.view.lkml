view: sales_reclutement {
  sql_table_name: `raw_data.sales_reclutement` ;;

dimension: order_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.order_id ;;
    description: "Unique ID of the order"
  }

  dimension: customer_id_ {
    type: string
    sql: ${TABLE}.customer_id_ ;;
    description: "Unique ID of the customer"
  }

  dimension: products_id {
    type: string
    sql: ${TABLE}.products_id ;;
    description: "ID of sold product"
  }

  dimension: net_sales {
    type: number
    sql: ${TABLE}.net_sales ;;
    value_format_name: eur
    description: "Net sales of this product line"
  }

  dimension: qty {
    type: number
    sql: ${TABLE}.qty ;;
    description: "Number of units sold of this product"
  }

  dimension_group: date {
    type: time
    timeframes: [raw, date, month, year]
    sql: ${TABLE}.date_date ;;
  }
