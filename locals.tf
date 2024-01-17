locals {
  vpc_id = length(length(vpc_id, main, null), subnet_id, main, null)
    tags   = {
      business_unit = "ecommerce"
      business_type = "retail"
      project_name  = "expence"
      cost_center   = 100
      env           = var.env
    }
  }