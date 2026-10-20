# Project identifier used for naming and tagging.
variable "project_name" {
  description = "Project name"
  type        = string
}

# Deployment environment, such as production.
variable "environment" {
  description = "Deployment environment"
  type        = string
}
