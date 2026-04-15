output "bastion_eks_policy_arn" {
  value = aws_iam_policy.bastion_eks_policy.arn
}
output "alb_controller_policy_arn" {
  value = aws_iam_policy.aws_load_balancer_controller.arn
}