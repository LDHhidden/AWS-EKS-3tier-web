# ami 동적 조회
data "aws_ami" "al2023" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name = "name"
    values = ["al2023-ami-*-kernel-6.1-x86_64"]
  }
  filter {
    name = "architecture"
    values = ["x86_64"]
  }
  filter {
    name = "state"
    values = ["available"]
  }
}  

# CREATE BASTION INSTANCE
resource "aws_instance" "bastion" {
  ami                         = data.aws_ami.al2023.id
  instance_type               = var.instance_type
  subnet_id                   = var.public_subnet_ids
  vpc_security_group_ids      = var.bastion_sg_id
  associate_public_ip_address = true
  key_name                    = var.key_name
  iam_instance_profile = var.bastion_eks_profile
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.31.13/2025-11-13/bin/linux/amd64/kubectl
              curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.31.13/2025-11-13/bin/linux/amd64/kubectl.sha256
              sha256sum kubectl
              cat kubectl.sha256
              chmod +x ./kubectl
              sudo mv ./kubectl /usr/local/bin/kubectl
              sudo yum install git -y
              sudo dnf install -y dnf-plugins-core
              sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
              sudo dnf -y install terraform
              curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
              chmod 700 get_helm.sh
              ./get_helm.sh
              EOF
  tags = {
    Name = "My-bastion"
  }
}
# CREATE APP INSTANCE
# resource "aws_instance" "web" {
#   ami = data.aws_ami.al2023.id
#   instance_type = var.instance_type
#   subnet_id = var.private_subnet_ids
#   vpc_security_group_ids = var.web_sg_id
#   associate_public_ip_address = false
#   key_name = var.key_name
#   user_data = <<-EOF
#               #!/bin/bash
#               yum update -y
#               yum install -y httpd
#               systemctl enable httpd
#               systemctl start httpd
#               echo "<h1>Hello from Terraform EC2</h1>" > /var/www/html/index.html
#               EOF
#   tags = {
#     Name = "My-web"
#   }

# }