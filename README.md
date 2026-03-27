# LookML Exercise: Business Orders & Sales Analysis

This repository contains a LookML project designed to analyze sales and order data, including customer segmentation based on historical purchase frequency.

## Project Structure

The project follows a layered architecture to ensure modularity and maintainability:

* **1. Base Views:** Direct mapping to raw data tables in BigQuery (`orders_reclutement`, `sales_reclutement`).
* **2. Refined Views:** Extensions of the base views that include business logic, such as measures for total sales and order counts.
* **3. Derived Tables:** Advanced logic for customer segmentation (New, Returning, VIP) based on a rolling 12-month window.
* **Models:** Configuration of the `orders` Explore, defining the relationships between orders, individual sales lines, and segments.

## Key Features

### Customer Segmentation
A SQL Derived Table (PDT) categorizes each order from 2023 based on the customer's activity in the previous 12 months:
- **New:** 0 previous orders.
- **Returning:** 1 to 3 previous orders.
- **VIP:** 4 or more previous orders.

### Metrics Included
- **Net Sales:** Sum of net revenue in EUR.
- **Order Count:** Distinct count of unique orders.
- **Quantity:** Total units sold.

## Setup Requirements

- **Connection:** Requires a functional Looker connection named `astrafy-conexion`.
- **Database:** Designed for Google BigQuery, referencing the `raw_data` dataset.
- **Caching:** Data is refreshed via a datagroup with a 1-hour maximum cache age.
