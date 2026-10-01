variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "distribution_id" {
  description = "CloudFront distribution ID"
  type        = string
}

variable "four_xx_error_rate_threshold" {
  description = "CloudFront 4xx error rate threshold percentage"
  type        = number
  default     = 5
}

variable "five_xx_error_rate_threshold" {
  description = "CloudFront 5xx error rate threshold percentage"
  type        = number
  default     = 1
}
# Email address that receives CloudWatch alarm notifications.
variable "alert_email" {
  description = "Email address for CloudWatch alarm notifications"
  type        = string
}
