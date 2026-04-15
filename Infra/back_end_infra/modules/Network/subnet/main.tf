# 단일 서브넷 생성
# resource "aws_subnet" "this" { 
#   vpc_id                  = var.vpc_id
#   cidr_block              = var.cidr
#   availability_zone       = var.az
#   map_public_ip_on_launch = var.public
#   tags = { Name = var.name }
# }

# 다중 서브넷 생성
resource "aws_subnet" "demo" {
  for_each = var.subnets
  vpc_id                  = var.vpc_id
  cidr_block              = each.value.cidr
  availability_zone       = each.value.az
  map_public_ip_on_launch = each.value.public

  tags = merge(
    {
      Name = each.key
      "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
    },
    each.value.public
    ? { "kubernetes.io/role/elb" = "1" }
    : { "kubernetes.io/role/internal-elb" = "1" }
  )
}