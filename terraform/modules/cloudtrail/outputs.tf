# CloudTrail trail ARN for reference and future integrations.
output "trail_arn" {
  description = "ARN of the CloudTrail audit trail"
  value       = aws_cloudtrail.audit.arn
}

# Dedicated audit log bucket name.
output "log_bucket_name" {
  description = "S3 bucket storing CloudTrail logs"
  value       = aws_s3_bucket.cloudtrail_logs.bucket
}
