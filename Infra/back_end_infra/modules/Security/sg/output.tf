output "bastion_sg_id" {
  value = aws_security_group.bastion.id
}
output "web_sg_id" {
  value = aws_security_group.web.id
}
output "db_sg_id" {
  value = aws_security_group.db.id
}
output "eks_cluster_sg_id" {
  value = aws_security_group.eks_cluster_sg.id
}
output "node_sg_id" {
  value = aws_security_group.node_sg.id
}