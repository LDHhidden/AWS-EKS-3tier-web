variable "vpc_id" {
  type        = string
}
variable "igw_id" {
  type        = string
}
variable "nat_id" {
  type = string
}
# 👉 퍼블릭 서브넷 ID 리스트 (optional)
variable "public_subnet_ids" {
  type        = map(string)
  default     = {}
}

variable "private_subnet_ids" {
  type = map(string)
  default = {}
}