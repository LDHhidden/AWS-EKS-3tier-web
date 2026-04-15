output "ami_id_used"   {
  value = data.aws_ami.al2023.id
}
output "ami_name_used" {
  value = data.aws_ami.al2023.name
}
output "public_ip"     {
  value = aws_instance.bastion.public_ip
}
