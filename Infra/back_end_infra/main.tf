# Network
module "network" {
  source           = "./modules/Network"
  eks_cluster_name = var.eks_cluster_name
}

module "iam" {
  source                   = "./modules/IAM"
  eks_cluster_name         = module.compute.eks_cluster_name
  eks_cluster_arn          = module.compute.eks_cluster_arn
  eks_cluster_provider_arn = module.compute.eks_cluster_provider_arn
  eks_cluster_provider_url = module.compute.eks_cluster_provider_url
}

module "security" {
  source = "./modules/Security/sg"
  vpc_id = module.network.vpc_id
}

module "compute" {
  source               = "./modules/Compute"
  vpc_id               = module.network.vpc_id
  region               = var.region
  eks_cluster_name     = var.eks_cluster_name
  public_subnet_ids    = module.network.public_subnet_ids["public-C"]
  private_subnet_ids   = [module.network.private_subnet_ids["app-a"], module.network.private_subnet_ids["app-c"]]
  bastion_sg_id        = [module.security.bastion_sg_id]
  web_sg_id            = [module.security.web_sg_id]
  eks_cluster_sg_id    = [module.security.eks_cluster_sg_id]
  node_sg_id           = [module.security.node_sg_id]
  bastion_eks_profile  = module.iam.bastion_profile
  eks_cluster_role_arn = module.iam.eks_cluster_role_arn
  node_role_arn        = module.iam.node_role_arn
}

module "storage" {
  source             = "./modules/Storage"
  vpc_id             = module.network.vpc_id
  private_subnet_ids = [module.network.private_subnet_ids["db-a"], module.network.private_subnet_ids["db-c"]]
  db_sg_id           = [module.security.db_sg_id]
}