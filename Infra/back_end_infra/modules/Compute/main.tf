# ec2 instance
module "ec2" {
  source = "./ec2"
  public_subnet_ids   = var.public_subnet_ids
  # private_subnet_ids = var.private_subnet_ids
  bastion_sg_id       = var.bastion_sg_id
  web_sg_id           = var.web_sg_id
  bastion_eks_profile = var.bastion_eks_profile
}
module "eks" {
  source = "./eks"
  eks_cluster_name = var.eks_cluster_name
  vpc_id = var.vpc_id
  region = var.region
  private_subnet_ids    = var.private_subnet_ids
  eks_cluster_sg_id     = var.eks_cluster_sg_id
  lt_id                 = module.launch_template.lt_id
  lt_version            = module.launch_template.lt_version
  eks_cluster_role_arn  = var.eks_cluster_role_arn
  node_role_arn         = var.node_role_arn
}
module "launch_template" {
  source = "./launch_template"
  eks_cluster_sg_id = var.eks_cluster_sg_id
  node_sg_id        = var.node_sg_id
}