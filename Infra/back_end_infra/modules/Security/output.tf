output "bastion_sg_id" {
  value = module.sg.bastion_sg_id
}
output "web_sg_id" {
  value = module.sg.web_sg_id
}
output "db_sg_id" {
  value = module.sg.db_sg_id
}
output "eks_cluster_sg_id" {
  value = module.sg.eks_cluster_sg_id
}
output "node_sg_id" {
  value = module.sg.node_sg_id
}
output "lt_id" {
  value = module.sg.lt_id
}
output "lt_version" {
  value = module.sg.lt_version
}