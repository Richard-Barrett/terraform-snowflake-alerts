terraform {
  required_version = ">= 1.5.6"
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.89.0"
    }
  }
}

provider "snowflake" {}

module "snowflake_warehouse_bi" {
  source  = "../.." # Path to the root of the Snowflake Module

  database  = "BI"
  schema    = "BI"
  warehouse = "BI"
  
  condition_sql = file("${path.module}/conditions/condition.sql")
  action_sql    = file("${path.module}/actions/action.sql")
}