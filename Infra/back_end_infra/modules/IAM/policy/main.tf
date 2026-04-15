# Bastion - EKS Policy
resource "aws_iam_policy" "bastion_eks_policy" {
  name = "bastion_eks_policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "eks:DescribeCluster"
        ]
        Resource = var.eks_cluster_arn
      }
    ]
  })
}

# ALB Policy
resource "aws_iam_policy" "aws_load_balancer_controller" {
  name   = "eks-AWSLoadBalancerControllerIAMPolicy"
  policy = file("${path.module}/AWSLoadBalancerControllerIAMPolicy.json")
}
