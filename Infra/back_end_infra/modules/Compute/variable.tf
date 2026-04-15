variable "public_subnet_ids" {
  type = string
}
variable "private_subnet_ids" {
  type = list(string)
}
variable "bastion_sg_id" {
  type = list(string)
}
variable "web_sg_id" {
  type = list(string)
}
variable "eks_cluster_sg_id" {
  type = list(string)
}
variable "node_sg_id" {
  type = list(string)
}
variable "eks_cluster_role_arn" {
  type = string
}
variable "node_role_arn" {
  type = string
}
variable "bastion_eks_profile" {
  type = string
}
variable "vpc_id" {
  type = string
}
variable "region" {
  type = string
}
variable "eks_cluster_name" {
  type = string
}