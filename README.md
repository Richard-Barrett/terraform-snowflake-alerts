# terraform-snowflake-alerts
Terraform Snowflake Module to Manage Snowflake Alerts

<img align="right" width="60" height="60" src="images/terraform.png">

# terraform-snowflake-warehouses module

This is a repository that makes a snowflake alert:

- snowflake_alert

Example CICD with `BitBucket` and `Codefresh`:

![Image](./images/diagram.png)

## Usage

To use the module you will need to use something adhering to the following format:

```hcl
module "snowflake_warehouse_bi" {
  source  = "https://github.com/Richard-Barrett/terraform-snowflake-alerts"
  version = "0.0.1"

  database  = "BI"
  schema    = "BI"
  warehouse = "BI"

  condition_sql = "select 1 as c"
  action_sql    = "select 1 as c"
}
```

What if you want to specify the `condition_sql` and `action_sql` as a file?

```hcl
module "snowflake_warehouse_bi" {
  source  = "https://github.com/Richard-Barrett/terraform-snowflake-alerts"
  version = "0.0.1"

  database  = "BI"
  schema    = "BI"
  warehouse = "BI"

  condition_sql = file("${path.module}/${var.condition_sql_file}")
  action_sql    = file("${path.module}/${var.action_sql_file}")
}
```

In this code, `${path.module}/${var.condition_sql_file}` and `${path.module}/${var.action_sql_file}` are the paths to the SQL files relative to the module. The `file` function reads the content of the files and assigns it to the `condition` and `action` attributes.

Please replace `"condition.sql"` and `"action.sql"` with the names of your SQL files. If the files are in a subdirectory of the module, you need to include the subdirectory in the file name, like `"subdirectory/condition.sql"`.

### Considerations

In general you may want to use the module in the following way:

```hcl
module "snowflake_warehouse_bi" {
  source  = "https://github.com/Richard-Barrett/terraform-snowflake-alerts"
  version = "0.0.1"

  database  = "BI"
  schema    = "BI"
  warehouse = "BI"

  condition_sql = file("${path.module}/conditions/condition.sql")
  action_sql    = file("${path.module}/actions/action.sql")
}
```

This means that where ever you are calling the alert module you will have a directory for both `conditions` and `actions` thereby allowing you to control and organize the way you call alerts

```
├───actions
└───conditions
main.tf
variables.tf
providers.tf
outputs.tf
data.tf
```

## Overview

In overview, this repository acts as a digestible module that allows you to create an alert in Snowflake in a modular way.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.7 |
| <a name="requirement_snowflake"></a> [snowflake](#requirement\_snowflake) | ~> 0.89.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_snowflake"></a> [snowflake](#provider\_snowflake) | ~> 0.89.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [snowflake_alert.alert](https://registry.terraform.io/providers/Snowflake-Labs/snowflake/latest/docs/resources/alert) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_action_sql"></a> [action\_sql](#input\_action\_sql) | SQL action to take when the alert is triggere. | `string` | n/a | yes |
| <a name="input_alert_interval"></a> [alert\_interval](#input\_alert\_interval) | value in minutes for the alert interval. | `number` | `10` | no |
| <a name="input_comment"></a> [comment](#input\_comment) | Comment for the alert or added description of alert | `string` | `""` | no |
| <a name="input_condition_sql"></a> [condition\_sql](#input\_condition\_sql) | SQL condition to trigger the alert. | `string` | n/a | yes |
| <a name="input_cron_expression"></a> [cron\_expression](#input\_cron\_expression) | The cron expression for the alert schedule | `string` | `null` | no |
| <a name="input_database"></a> [database](#input\_database) | Name of the Database you want to alert on. | `string` | n/a | yes |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | (Boolean) Specifies if an alert should be 'started' (enabled) after creation or should remain 'suspended' (default). | `bool` | `true` | no |
| <a name="input_include_alert_schedule"></a> [include\_alert\_schedule](#input\_include\_alert\_schedule) | Whether to include the alert\_schedule block | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the alert | `string` | n/a | yes |
| <a name="input_schema"></a> [schema](#input\_schema) | Name of the Schema you want to alert on. | `string` | n/a | yes |
| <a name="input_time_zone"></a> [time\_zone](#input\_time\_zone) | The timezone for the cron schedule | `string` | `"UTC"` | no |
| <a name="input_warehouse"></a> [warehouse](#input\_warehouse) | Name of the Warehouse you want to alert on | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
