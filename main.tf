terraform {
  required_version = ">= 1.5.6"
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.89.0"
    }
  }
}

resource "snowflake_alert" "alert" {
  database  = var.database
  schema    = var.schema
  name      = var.name
  warehouse = var.warehouse

  dynamic "alert_schedule" {
    for_each = var.include_alert_schedule ? [1] : []
    content {
      interval = var.alert_interval
      cron {
        expression  = var.cron_expression
        time_zone   = var.time_zone
      }
    }
  }
  
  condition = var.condition_sql
  action    = var.action_sql
  enabled   = var.enabled
  comment   = var.comment
}
