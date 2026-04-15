# BASTION SG
resource "aws_security_group" "bastion" {
  name        = "bastion-sg"
  description = "bastion SSH"
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "bastion-sg" }
}
resource "aws_security_group_rule" "bastion" {
  type = "ingress"
  security_group_id = aws_security_group.bastion.id
  protocol = "tcp"
  from_port = var.ssh_port
  to_port = var.ssh_port
  cidr_blocks = ["0.0.0.0/0"]
}

# WEBSERVER SG
resource "aws_security_group" "web" {
  name        = "web-sg"
  description = "web SSH"
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = { Name = "web-sg"}
}
resource "aws_security_group_rule" "bastion-web-connect" {
  type = "ingress"
  security_group_id = aws_security_group.web.id
  protocol = "tcp"
  from_port = var.ssh_port
  to_port = var.ssh_port
  source_security_group_id = aws_security_group.bastion.id
}
resource "aws_security_group_rule" "http" {
  type = "ingress"
  security_group_id = aws_security_group.web.id
  protocol = "tcp"
  from_port = var.http_port
  to_port = var.http_port
  source_security_group_id = aws_security_group.bastion.id
}

# DB SG
resource "aws_security_group" "db" {
  name = "db-sg"
  vpc_id = var.vpc_id
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = { name = "db-sg"}
}
resource "aws_security_group_rule" "bastion-db-connect" {
  type = "ingress"
  security_group_id = aws_security_group.db.id
  protocol = "tcp"
  from_port = var.db_port
  to_port = var.db_port
  source_security_group_id = aws_security_group.bastion.id
}
resource "aws_security_group_rule" "node-db-connect" {
  type = "ingress"
  security_group_id = aws_security_group.db.id
  protocol = "tcp"
  from_port = var.db_port
  to_port = var.db_port
  source_security_group_id = aws_security_group.node_sg.id
}

# EKS SG
resource "aws_security_group" "eks_cluster_sg" {
  name        = "eks_cluster_sg"
  description = "EKS cluster security group"
  vpc_id      = var.vpc_id

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_security_group_rule" "https_bastion-eks" {
  type = "ingress"
  security_group_id = aws_security_group.eks_cluster_sg.id
  protocol = "tcp"
  from_port = var.https_port
  to_port = var.https_port
  source_security_group_id = aws_security_group.bastion.id
}
resource "aws_security_group_rule" "http_bastion-eks" {
  type = "ingress"
  security_group_id = aws_security_group.eks_cluster_sg.id
  protocol = "tcp"
  from_port = var.http_port
  to_port = var.http_port
  source_security_group_id = aws_security_group.bastion.id
}
resource "aws_security_group_rule" "node_to_cluster_all" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 65535
  protocol                 = "tcp"
  security_group_id        = aws_security_group.eks_cluster_sg.id
  source_security_group_id = aws_security_group.node_sg.id
  description              = "Allow nodes to control plane"
}
# Node SG
resource "aws_security_group" "node_sg" {
  name        = "node_sg"
  description = "EKS node security group"
  vpc_id      = var.vpc_id

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_security_group_rule" "cluster_to_node_all" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 65535
  protocol                 = "tcp"
  security_group_id        = aws_security_group.node_sg.id
  source_security_group_id = aws_security_group.eks_cluster_sg.id
  description              = "Allow control plane to nodes"
}
resource "aws_security_group_rule" "node_to_node_all" {
  type                     = "ingress"
  security_group_id        = aws_security_group.node_sg.id
  source_security_group_id = aws_security_group.node_sg.id
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  description              = "Allow all traffic between EKS nodes"
}
resource "aws_security_group_rule" "alb-node-connect" {
  type = "ingress"
  from_port = 8000
  to_port = 8000
  protocol = "tcp"
  security_group_id = aws_security_group.node_sg.id
  source_security_group_id = aws_security_group.alb_sg.id
}

# ALB SG
resource "aws_security_group" "alb_sg" {
  name        = "alb-sg"
  description = "alb-node"
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "alb-sg" }
}
resource "aws_security_group_rule" "inbound-alb-http" {
  type = "ingress"
  from_port = var.http_port
  to_port = var.http_port
  protocol = "tcp"
  security_group_id = aws_security_group.alb_sg.id
  cidr_blocks = ["0.0.0.0/0"]
}
resource "aws_security_group_rule" "inbound-alb-https" {
  type = "ingress"
  from_port = var.https_port
  to_port = var.https_port
  protocol = "tcp"
  security_group_id = aws_security_group.alb_sg.id
  cidr_blocks = ["0.0.0.0/0"]
}
