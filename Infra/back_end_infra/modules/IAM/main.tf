module "policy" {
  source = "./policy"
  eks_cluster_arn = var.eks_cluster_arn
}

module "role" {
  source = "./role"
  alb_controller_policy_arn = module.policy.alb_controller_policy_arn
  bastion_eks_policy_arn = module.policy.bastion_eks_policy_arn
  eks_cluster_name = var.eks_cluster_name
  eks_cluster_provider_arn = var.eks_cluster_provider_arn
  eks_cluster_provider_url = var.eks_cluster_provider_url
}