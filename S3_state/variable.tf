variable "region" {
  type = string
  default = "ap-northeast-2"
}

variable "bucket_name" {
  description = "Terraform state bucket name"
  type        = string
  default = "eks-addon-state-bucket"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}