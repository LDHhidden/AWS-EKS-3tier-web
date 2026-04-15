output "vpc_id"  {
  value = module.vpc.vpc_id
}
output "vpc_cidr"{
  value = module.vpc.vpc_cidr
}
output "public_subnet_ids" {
  value = module.subnet.public_subnet_ids
}
output "private_subnet_ids" {
  value = module.subnet.private_subnet_ids
}
output "eip_id" {
  value = module.eip.eip_id
}
output "igw_id" {
  value = module.gw.igw_id
}
output "nat_id" {
  value = module.gw.nat_id
}