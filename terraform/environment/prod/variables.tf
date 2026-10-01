variable "aws_region" {
  description = "AWS region for the infrastructure"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "northstar-orthodontics-infra"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "production"
}

