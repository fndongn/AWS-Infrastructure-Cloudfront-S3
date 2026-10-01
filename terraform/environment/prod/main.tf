module "s3" {
  source = "../../modules/s3"

  project_name = var.project_name
  environment  = var.environment
}

module "cloudfront" {
  source = "../../modules/cloudfront"

  project_name = var.project_name
  environment  = var.environment

  bucket_regional_domain_name = module.s3.bucket_regional_domain_name
}

module "monitoring" {
  source = "../../modules/monitoring"

  project_name = var.project_name
  environment  = var.environment

  distribution_id = module.cloudfront.distribution_id

  alert_email = var.alert_email
}
