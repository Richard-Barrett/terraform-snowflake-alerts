variable "warehouse" {
  type        = string
  description = "Name of the Warehouse you want to alert on"
}

variable "comment" {
  type        = string
  description = "Comment for the alert or added description of alert"
  default     = ""
}

variable "name" {
  type        = string
  description = "Name of the alert"
}

variable "enabled" {
  type        = bool
  description = "(Boolean) Specifies if an alert should be 'started' (enabled) after creation or should remain 'suspended' (default)."
  default     = true
}

variable "alert_interval" {
  type        = number
  description = "value in minutes for the alert interval."
  default     = 10
}

variable "condition_sql" {
  type        = string
  description = "SQL condition to trigger the alert."
}

variable "action_sql" {
  type        = string
  description = "SQL action to take when the alert is triggere."
}

variable "database" {
  type        = string
  description = "Name of the Database you want to alert on."
}

variable "schema" {
  type        = string
  description = "Name of the Schema you want to alert on."
}

variable "include_alert_schedule" {
  description = "Whether to include the alert_schedule block"
  type        = bool
  default     = false
}

variable "cron_expression" {
  description = "The cron expression for the alert schedule"
  type        = string
  default     = null
}

variable "time_zone" {
  description = "The timezone for the cron schedule"
  type        = string
  default     = "UTC"
}
