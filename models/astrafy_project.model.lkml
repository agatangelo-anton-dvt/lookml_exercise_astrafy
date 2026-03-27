connection: "astrafy-conexion"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: astrafy_project_default_datagroup {
  sql_trigger: SELECT MAX(order_id) FROM raw_data.orders_reclutement;;
  max_cache_age: "1 hour"
}

persist_with: astrafy_project_default_datagroup

explore: orders_reclutement {
  label: "Business Orders & Sales Analysis"

  # Join Sales (1 order -> N lines of sales)
  join: sales_reclutement {
    type: left_outer
    relationship: one_to_many
    sql_on: ${orders_reclutement.orders_id} = ${sales_reclutement.order_id} ;;
  }

  # Join segmentation (1 order -> 1 segment)
  join: order_segmentation {
    type: left_outer
    relationship: one_to_one
    sql_on: ${orders_reclutement.orders_id} = ${order_segmentation.orders_id} ;;
  }
}
