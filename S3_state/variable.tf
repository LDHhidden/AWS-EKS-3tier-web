variable "region" {
  type = string
  default = "ap-northeast-2"
}

variable "bucket_prefix" {
  description = "Terraform state bucket name"
  type        = string
  default     = "tfstate-bucket-"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}