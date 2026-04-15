output "public_subnet_ids" {
  value = {
    for k, v in aws_subnet.demo :
    k => v.id if var.subnets[k].public == true
  }
}
output "private_subnet_ids" {
  value = {
    for k, v in aws_subnet.demo :
    k => v.id if var.subnets[k].public == false
  }
}

# output "subnet_ids_public_list" {
#   value = [for k, id in {
#     for k, s in aws_subnet.demo :
#     k => s.id if var.subnets[k].public
#   } : id]
# }

# output "subnet_ids_private_list" {
#   value = [for k, id in {
#     for k, s in aws_subnet.demo :
#     k => s.id if !var.subnets[k].public
#   } : id]
# }