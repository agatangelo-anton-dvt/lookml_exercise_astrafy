include: "/views/1.base_views/sales_reclutement.view.lkml"

view: +sales_reclutement {

  measure: sum_net_sales {
    type: sum
    sql: ${net_sales} ;;
    description: "Sum of net sales"
  }

  measure: total_qty {
    type: sum
    sql: ${qty} ;;
    description: "Total sum of quantity"
  }
   }
