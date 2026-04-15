# Internet Gateway
resource "aws_internet_gateway" "demo" {
  vpc_id = var.vpc_id
  tags = {
    Name = "My-igw"
  }
}

# NAT Gateway
resource "aws_nat_gateway" "demo" {
  allocation_id = var.allocation_id
  subnet_id = var.public_subnet_ids
  connectivity_type = "public"
  tags = {
    Name = "My-natgw"
  }
}