variable "kubernetes_version" {
  type    = string
  default = "1.31"
}

variable "eks_cluster_role_arn" {
  type = string
}

variable "node_role_arn" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "public_access_cidrs" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "node_desired_size" {
  type    = number
  default = 2
}

variable "node_min_size" {
  type    = number
  default = 1
}

variable "node_max_size" {
  type    = number
  default = 3
}

variable "node_instance_types" {
  type    = list(string)
  default = ["t3.medium"]
}

variable "capacity_type" {
  type    = string
  default = "ON_DEMAND"
}

variable "ami_type" {
  type    = string
  default = "AL2_x86_64"
}

variable "node_disk_size" {
  type    = number
  default = 20
}
variable "eks_cluster_sg_id" {
  type = list(string)
}
variable "lt_id" {
  type = string
}
variable "lt_version" {
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