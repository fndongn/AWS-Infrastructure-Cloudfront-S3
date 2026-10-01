output "s3_bucket_name" {
  description = "Website S3 bucket"
  value       = module.s3.bucket_name
}

output "cloudfront_distribution_id" {
  description = "CloudFront distribution ID"
  value       = module.cloudfront.distribution_id
}

output "cloudfront_domain_name" {
  description = "CloudFront website URL"
  value       = "https://${module.cloudfront.distribution_domain_name}"
}
