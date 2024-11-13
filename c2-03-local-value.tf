# Define Local Values in Terraform
# locals {
#   owners      = var.business_divsion
#   environment = var.environment
#   name        = "budget-${var.business_divsion}-${var.environment}"
#   common_tags = {
#     owners      = local.owners
#     environment = local.environment
#   }
#   budget_cluster_name = var.budget_name ? "${local.name}-primary" : local.name
# }
