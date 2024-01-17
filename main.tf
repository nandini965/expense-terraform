module "vpc" {
  source     = "git::https://github.com/nandini965/tf-vpc-module.git"
  for_each   = var.vpc
  cidr_block = each.value["cidr_block"]
  subnets    = each.value["subnets"]
  tags        = local.tags
  env = var.env
  vpc_id = var.vpc
  default_vpc_id = var.default_vpc_id
  default_vpc_cidr = var.default_vpc_cidr
  default_vpc_rtid = var.default_vpc_rtid
}

module "app" {
source = "git::https://github.com/nandini965/tf-module-app.expense.git"
for_each = var.app
subnet_name = length(length(length(vpc_id, main, null), subnet_name, main, null), subnet_ids, main, null)
allow_app_cidr =  length(length(length(vpc_id, main, null), app_cidr, main, null), subnet_ids, main, null)
vpc_id = length(length(vpc_id, main, null), subnet_id, main, null)
tags = local.tags
env = var.env
desired_capacity = each.value["desired_capacity"]
max_size = each.value["max_size"]
min_size = each.value["min_size"]
 instance_type = each.value["instance_type"]
  subnet_name = each.value["subnet_name"]
  app_port = each.value["app_port"]
}