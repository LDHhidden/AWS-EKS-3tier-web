variable "region" {
  type = string
  default = "ap-northeast-2"
}
variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "eks_state_bucket" {
  description = "S3 bucket name that stores eks-infra remote state"
  type        = string
}

variable "eks_state_key" {
  description = "S3 key path for eks-infra remote state"
  type        = string
  default     = "env/dev/eks/terraform.tfstate"
}

variable "alb_controller_chart_version" {
  description = "Helm chart version for AWS Load Balancer Controller"
  type        = string
  default     = "1.14.0"
}