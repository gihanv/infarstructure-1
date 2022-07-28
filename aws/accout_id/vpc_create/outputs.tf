output "vpc_id" {

  value = module.vpc_test.vpc_id
}

output "vpc_cidr_block" {

  value = module.vpc_test.vpc_cidr_block
}

output "default_security_group_id" {

  value = module.vpc_test.default_security_group_id
}

output "default_network_acl_id" {

  value = module.vpc_test.default_network_acl_id
}

output "default_route_table_id" {

  value = module.vpc_test.default_route_table_id
}

output "vpc_instance_tenancy" {

  value = module.vpc_test.vpc_instance_tenancy
}

output "vpc_enable_dns_support" {

  value = module.vpc_test.vpc_enable_dns_support
}

output "vpc_enable_dns_hostnames" {

  value = module.vpc_test.vpc_enable_dns_hostnames
}

output "vpc_main_route_table_id" {

  value = module.vpc_test.vpc_main_route_table_id
}

output "private_subnets" {

  value = module.vpc_test.private_subnets
}

output "private_subnets_cidr_blocks" {

  value = module.vpc_test.private_subnets_cidr_blocks
}

output "public_subnets" {

  value = module.vpc_test.public_subnets
}

output "public_subnets_cidr_blocks" {

  value = module.vpc_test.public_subnets_cidr_blocks
}

output "public_route_table_ids" {

  value = module.vpc_test.public_route_table_ids
}

output "private_route_table_ids" {

  value = module.vpc_test.private_route_table_ids
}

output "nat_ids" {

  value = module.vpc_test.nat_ids
}

output "nat_public_ips" {

  value = module.vpc_test.nat_public_ips
}

output "natgw_ids" {
  value = module.vpc_test.natgw_ids
}

output "igw_id" {

  value = module.vpc_test.igw_id
}
output "azs" {

  value = module.vpc_test.azs
}