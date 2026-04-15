module "rds" {
 source = "./rds"
 vpc_id = var.vpc_id
 private_subnet_ids = var.private_subnet_ids
 db_sg_id = var.db_sg_id
}
module "ecr" {
  source = "./ecr"
}