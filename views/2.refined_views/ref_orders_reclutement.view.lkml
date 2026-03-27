include: "/views/1.base_views/orders_reclutement.view.lkml"

view: +orders_reclutement {

  measure: count_orders {
    type: count_distinct
    sql: ${orders_id} ;;
    description: "Count distinct of orders"
  }

  measure: sum_net_sales {
    type: sum
    sql: ${net_sales} ;;
    description: "Sum of net sales"
  }
   }
