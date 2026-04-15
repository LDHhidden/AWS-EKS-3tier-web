data "tls_certificate" "eks_oidc" {
  url = aws_eks_cluster.demo.identity[0].oidc[0].issuer
}