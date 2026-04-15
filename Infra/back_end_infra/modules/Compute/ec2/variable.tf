variable "instance_type"{
  type = string
  default = "t3.micro"
}  # 프리티어 권장
variable "public_subnet_ids" {
  type = string
}
# variable "private_subnet_ids" {
#   type = string
# }                      
variable "bastion_sg_id"      {
  type = list(string)
}
variable "web_sg_id" {
  type = list(string)
}                 
variable "key_name"     {
  type = string
  default = "demo-key"
}
variable "bastion_eks_profile" {
  type = string
}