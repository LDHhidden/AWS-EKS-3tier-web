variable "vpc_id" {
  type        = string
}
# 인터넷에서 받는 Web 포트 CIDR (필요 시 제한)
variable "web_ingress_cidrs" {
  description = "web-sg가 80/443을 허용할 소스 CIDR 목록"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

# 내부 포트 (필요하면 바꿔서 사용)
variable "ssh_port" {
  type = number
  default = 22
}
variable "http_port" {
  type = number
  default = 80
}
variable "https_port" {
  type = number
  default = 443
}
variable "app_port" {
  type    = number
  default = 8080
}

variable "db_port" {
  type    = number
  default = 3306
}
