output "eks_cluster_role_arn" {
  value = module.role.eks_cluster_role_arn
}
output "node_role_arn" {
  value = module.role.node_role_arn
}
output "bastion_profile" {
  value = module.role.bastion_profile
}
output "alb_controller_role_arn" {
  value = module.role.alb_controller_role_arn
}
output "alb_controller_policy_arn" {
  value = module.policy.alb_controller_policy_arn
}