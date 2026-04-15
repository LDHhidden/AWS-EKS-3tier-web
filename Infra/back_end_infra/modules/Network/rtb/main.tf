# Create Public Route Table
resource "aws_route_table" "public" {
  vpc_id = var.vpc_id
  tags = {
    Name = "My-public-rtb"
  }
}
# Public Routing
resource "aws_route" "public_route" {
  route_table_id = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = var.igw_id
}
# Connection Public-Subnet - Public Route Table
resource "aws_route_table_association" "public_assoc" {
  for_each       = var.public_subnet_ids
  subnet_id      = each.value
  route_table_id = aws_route_table.public.id
}

# Create Private Route Table
resource "aws_route_table" "private" {
  vpc_id = var.vpc_id
  
  tags = {
    Name = "My-private-rtb"
  }
}
# Private Routing
resource "aws_route" "private_route" {
  route_table_id = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = var.nat_id
}
# Connection Private-Subnet - Private Route Table
resource "aws_route_table_association" "private_assoc" {
  for_each = var.private_subnet_ids
  subnet_id = each.value
  route_table_id = aws_route_table.private.id
}