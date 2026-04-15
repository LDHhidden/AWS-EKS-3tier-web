resource "aws_eks_cluster" "demo" {
  name     = var.eks_cluster_name
  role_arn = var.eks_cluster_role_arn
  version  = var.kubernetes_version

  vpc_config {
    subnet_ids              = var.private_subnet_ids
    endpoint_private_access = true
    endpoint_public_access  = false
    security_group_ids = var.eks_cluster_sg_id
  }
  access_config {
    authentication_mode = "API_AND_CONFIG_MAP"
    bootstrap_cluster_creator_admin_permissions = true
  }

}

resource "aws_eks_node_group" "demo_node_group" {
  cluster_name    = aws_eks_cluster.demo.name
  node_group_name = "demo_node_group"
  node_role_arn   = var.node_role_arn
  subnet_ids      = var.private_subnet_ids

  scaling_config {
    desired_size = var.node_desired_size
    min_size     = var.node_min_size
    max_size     = var.node_max_size
  }

  instance_types = var.node_instance_types
  capacity_type  = var.capacity_type
  ami_type       = var.ami_type
#   disk_size      = var.node_disk_size

  tags = {
    Name = "demo_node_group"
  }
  launch_template {
    id      = var.lt_id
    version = var.lt_version
  }

  depends_on = [
    aws_eks_cluster.demo
  ]
}

resource "aws_iam_openid_connect_provider" "eks" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.eks_oidc.certificates[0].sha1_fingerprint]
  url             = aws_eks_cluster.demo.identity[0].oidc[0].issuer
}