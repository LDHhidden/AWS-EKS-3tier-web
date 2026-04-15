output "eks_cluster_name" {
  value = aws_eks_cluster.demo.name
}
output "eks_cluster_arn" {
  value = aws_eks_cluster.demo.arn
}
output "eks_cluster_endpoint" {
  value = aws_eks_cluster.demo.endpoint
}
output "eks_cluster_ca_data" {
  value = aws_eks_cluster.demo.certificate_authority[0].data
}
output "eks_cluster_provider_arn" {
  value = aws_iam_openid_connect_provider.eks.arn
}
output "eks_cluster_provider_url" {
  value = aws_iam_openid_connect_provider.eks.url
}