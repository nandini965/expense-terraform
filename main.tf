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

#module "app" {
#  depends_on = [module.vpc, module.rds, module.alb]
#  source = "git::https://github.com/nandini965/tf-module-app.expense.git"
#  name = each.value["name"]
# for_each = var.app
#  subnet_ids     = lookup(lookup(lookup(lookup(module.vpc, "main", null), "subnets", null), each.value["subnet_name"], null), "subnets_ids", null)
#  vpc_id         = lookup(lookup(module.vpc, "main", null), "vpc_id", null)
#  allow_app_cidr = lookup(lookup(lookup(lookup(module.vpc, "main", null), "subnets", null), each.value["allow_app_cidr"], null), "subnets_cidr", null)
#  listener_arn   = lookup(lookup(module.alb, each.value["lb_type"], null), "listener_arn", null)
#  lb_dns_name    = lookup(lookup(module.alb, each.value["lb_type"], null), "dns_name", null)
#  dns_name          = each.value["name"] == "frontend" ? each.value["dns_name"] : "${each.value["name"]}-${var.env}"
#  desired_capacity = each.value["desired_capacity"]
# max_size = each.value["max_size"]
# min_size = each.value["min_size"]
# instance_type = each.value["instance_type"]
#  app_port = each.value["app_port"]
#  bastion_cidr = var.bastion_cidr
#  tags = local.tags
#  env = var.env
#  kms_arn = var.kms_arn
#  listener_priority =each.value["listener_priority"]
#  domain_name = var.domain_name
#  domain_id    = var.domain_id
#
#}
#
#module "alb" {
#  source         = "git::https://github.com/nandini965/tf-module-alb.expense.git"
#  for_each       = var.alb
#  name           = each.value["name"]
#  tags           = local.tags
#  env            = var.env
#  internal       = each.value["internal"]
#  subnets        = lookup(lookup(lookup(lookup(module.vpc, "main", null), "subnets", null), each.value["subnet_name"], null), "subnets_ids", null)
#  allow_alb_cidr = lookup(lookup(lookup(lookup(module.vpc, "main", null), "subnets", null), "app", null), "subnets_cidr", null)
#  dns_name          = each.value["name"] == "frontend" ? each.value["dns_name"] : "${each.value["name"]}-${var.env}"
#  vpc_id         = local.vpc_id
#}
#module "rds" {
#  source = "git::https://github.com/nandini965/tf-module-rds.expense.git"
#  for_each = var.rds
#  instance_class = each.value["instance_class"]
#  instance_count = each.value["instance_count"]
#  engine_version = each.value["engine_version"]
#  subnets     = lookup(lookup(lookup(lookup(module.vpc, "main", null), "subnets", null), each.value["subnet_name"], null), "subnets_ids", null)
#  allow_db_cidr = lookup(lookup(lookup(lookup(module.vpc, "main", null), "subnets", null), each.value["allow_db_cidr"], null), "subnets_cidr", null)
#  tags = local.tags
#  env = var.env
#  vpc_id = local.vpc_id
#  kms_arn = var.kms_arn
#}