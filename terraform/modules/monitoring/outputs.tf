# ARN of the CloudWatch alarm monitoring CloudFront 4xx errors.
output "four_xx_alarm_arn" {
  description = "ARN of the CloudFront 4xx error alarm"
  value       = aws_cloudwatch_metric_alarm.cloudfront_4xx_errors.arn
}

# ARN of the CloudWatch alarm monitoring CloudFront 5xx errors.
output "five_xx_alarm_arn" {
  description = "ARN of the CloudFront 5xx error alarm"
  value       = aws_cloudwatch_metric_alarm.cloudfront_5xx_errors.arn
}
