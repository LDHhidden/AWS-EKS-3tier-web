output "region" {
  value = var.region
}
output "vpc_id" {
  value = module.network.vpc_id
}
output "private_subnet_ids" {
  value = module.network.private_subnet_ids
}
output "eks_cluster_name" {
  value = var.eks_cluster_name
}
output "eks_cluster_ca_data" {
  value = module.compute.eks_cluster_ca_data
}
output "eks_cluster_endpoint" {
  value = module.compute.eks_cluster_endpoint
}
output "eks_cluster_provider_arn" {
  value = module.compute.eks_cluster_provider_arn
}
output "eks_cluster_provider_url" {
  value = module.compute.eks_cluster_provider_url
}
output "alb_controller_role_arn" {
  value = module.iam.alb_controller_role_arn
}
output "alb_controller_policy_arn" {
  value = module.iam.alb_controller_policy_arn
}
output "eks_cluster_sg_id" {
  value = module.security.eks_cluster_sg_id
}
output "node_sg_id" {
  value = module.security.node_sg_id
}