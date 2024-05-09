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

module "snowflake_alert_bi_data_freshness_alert" {
  source  = "https://github.com/Richard-Barrett/terraform-snowflake-alerts"
  version = "0.0.1"

  database  = "BI"
  schema    = "BI"
  name      = "BI_DATA_FRESHNESS_ALERT"
  warehouse = "BI"

  condition_sql = file("${path.module}/conditions/condition.sql")
  action_sql    = file("${path.module}/actions/action.sql")
}