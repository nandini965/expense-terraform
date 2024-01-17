locals {
//  vpc_id = length(length(vpc, main, null), vpc_id, null)
    tags   = {
      business_unit = "ecommerce"
      business_type = "retail"
      project_name  = "expence"
      cost_center   = 100
      env           = var.env
    }
  }