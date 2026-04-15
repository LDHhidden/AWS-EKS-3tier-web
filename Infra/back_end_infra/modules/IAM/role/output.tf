output "eks_cluster_role_arn" {
  description = "EKS cluster IAM role ARN"
  value       = aws_iam_role.eks_cluster_role.arn
}

output "node_role_arn" {
  description = "EKS node IAM role ARN"
  value       = aws_iam_role.node_role.arn
}

output "bastion_role_arn" {
  value = aws_iam_role.bastion_role.arn
}
output "bastion_profile" {
  value = aws_iam_instance_profile.bastion_profile.name
}
output "alb_controller_role_arn" {
  value = aws_iam_role.aws_load_balancer_controller.arn
}
