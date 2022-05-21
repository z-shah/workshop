output "network_name" {
  value = module.vpc.network_name
}

output "subnet_names" {
  value = module.vpc.subnets_names
}

output "pods_cidr_range_names" {
  value = module.vpc.subnets_secondary_ranges[*][0].range_name
}

output "pods_cidrs" {
  value = module.vpc.subnets_secondary_ranges[*][0].ip_cidr_range
}

output "services_cidr_range_names" {
  value = module.vpc.subnets_secondary_ranges[*][1].range_name
}

output "services_cidrs" {
  value = module.vpc.subnets_secondary_ranges[*][1].ip_cidr_range
}
