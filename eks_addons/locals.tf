locals {
  cluster_name            = data.terraform_remote_state.eks.outputs.eks_cluster_name
  cluster_endpoint        = data.terraform_remote_state.eks.outputs.eks_cluster_endpoint
  cluster_ca_data         = data.terraform_remote_state.eks.outputs.eks_cluster_ca_data
  vpc_id                  = data.terraform_remote_state.eks.outputs.vpc_id
  alb_controller_role_arn = data.terraform_remote_state.eks.outputs.alb_controller_role_arn
}