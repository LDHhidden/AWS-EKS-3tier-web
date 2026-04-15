# vpc
module "vpc"{
  source     = "./vpc"
  cidr       = var.vpc_cidr
  name       = var.vpc_name
}
# subnet
module "subnet"{
  source = "./subnet"
  vpc_id = module.vpc.vpc_id
  eks_cluster_name = var.eks_cluster_name
}
module "eip" {
  source = "./eip"
}
# internet gateway
module "gw"{
  source = "./gw"
  vpc_id = module.vpc.vpc_id
  allocation_id = module.eip.eip_id
  public_subnet_ids = module.subnet.public_subnet_ids["public-A"]
}
# route table
module "rtb" {
  source = "./rtb"
  vpc_id = module.vpc.vpc_id
  public_subnet_ids = module.subnet.public_subnet_ids
  private_subnet_ids = module.subnet.private_subnet_ids
  igw_id = module.gw.igw_id
  nat_id = module.gw.nat_id
}