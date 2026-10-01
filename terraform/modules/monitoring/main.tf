# ------------------------------------------------------------
# CloudFront 4xx Error Alarm
# ------------------------------------------------------------
# Monitors client/request-related errors such as missing objects
# or invalid requests. A sustained error rate above the threshold
# can indicate broken links, missing website files, or configuration
# issues affecting users.
resource "aws_cloudwatch_metric_alarm" "cloudfront_4xx_errors" {
  alarm_name = "${var.project_name}-${var.environment}-cloudfront-4xx-errors"

  alarm_description = "Monitors the CloudFront 4xx error rate."

  # CloudFront publishes its operational metrics to the
  # AWS/CloudFront CloudWatch namespace.
  namespace   = "AWS/CloudFront"
  metric_name = "4xxErrorRate"

  # CloudFront metrics are associated with the distribution ID
  # and use the Global region.
  dimensions = {
    DistributionId = var.distribution_id
    Region         = "Global"
  }

  # Evaluate the average error rate over 5-minute periods.
  statistic          = "Average"
  period              = 300
  evaluation_periods = 2

  # Trigger when the 4xx error rate exceeds 5%.
  threshold           = var.four_xx_error_rate_threshold
  comparison_operator = "GreaterThanThreshold"

  # Do not trigger an alarm when CloudWatch has no data.
  # This is appropriate for periods with little or no traffic.
  treat_missing_data = "notBreaching"

  alarm_actions = [
    aws_sns_topic.cloudwatch_alerts.arn
] 
    tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }

}


# ------------------------------------------------------------
# CloudFront 5xx Error Alarm
# ------------------------------------------------------------
# Monitors server-side errors returned through CloudFront.
# A sustained 5xx rate can indicate origin or infrastructure
# problems that may affect website availability.
resource "aws_cloudwatch_metric_alarm" "cloudfront_5xx_errors" {
  alarm_name = "${var.project_name}-${var.environment}-cloudfront-5xx-errors"

  alarm_description = "Monitors the CloudFront 5xx error rate."

  namespace   = "AWS/CloudFront"
  metric_name = "5xxErrorRate"

  dimensions = {
    DistributionId = var.distribution_id
    Region         = "Global"
  }

  # Evaluate the average error rate over 5-minute periods.
  statistic          = "Average"
  period              = 300
  evaluation_periods = 2

  # Trigger when the 5xx error rate exceeds 1%.
  # This is intentionally more sensitive than the 4xx alarm
  # because 5xx errors can indicate origin/service failures.
  threshold           = var.five_xx_error_rate_threshold
  comparison_operator = "GreaterThanThreshold"

  # Avoid false alarms when there is no metric data.
  treat_missing_data = "notBreaching"
  alarm_actions = [
  aws_sns_topic.cloudwatch_alerts.arn
]
  tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}
# ------------------------------------------------------------
# SNS Notification Topic
# ------------------------------------------------------------
# Provides a notification channel for CloudWatch alarms.
resource "aws_sns_topic" "cloudwatch_alerts" {
  name = "${var.project_name}-${var.environment}-alerts"

  tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

# Subscribe the alert email address to the SNS topic.
# AWS requires the recipient to confirm the subscription
# before notifications can be delivered.
resource "aws_sns_topic_subscription" "email_alert" {
  topic_arn = aws_sns_topic.cloudwatch_alerts.arn
  protocol  = "email"
  endpoint  = var.alert_email
}
