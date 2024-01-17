module vpc {
  source = "git::https://github.com/nandini965/tf-vpc-module.git"
for_each = vpc
cidr_block = each.value["cidr_blocks"]
subnets = each.value[subnets]
tags = local.tags
}