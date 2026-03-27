view: orders_reclutement {
  sql_table_name: `raw_data.orders_reclutement` ;;

dimension: orders_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.orders_id ;;
    description: "Unique order ID"
  }

  dimension: customers_id {
    type: string
    sql: ${TABLE}.customers_id ;;
    description: "Customer ID of the person who placed the order"
  }

  dimension: net_sales {
    type: number
    sql: ${TABLE}.net_sales ;;
    value_format_name: eur
    description: "Total net sale of the order"
  }

  dimension_group: date {
    type: time
    timeframes: [raw, date, month, year]
    sql: ${TABLE}.date_date ;;
    description: "Date the order was placed"
  }
