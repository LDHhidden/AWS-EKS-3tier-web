variable "vpc_id"  {
  type = string
}
variable "subnets" {
  description = "List of subnet definitions"
  type = map(object({
    cidr = string
    az   = string
    public = bool
  }))
  default = {
    public-A = { cidr = "10.0.1.0/24", az = "ap-northeast-2a", public = true }
    public-C = { cidr = "10.0.2.0/24", az = "ap-northeast-2c", public = true }
    app-a = { cidr = "10.0.11.0/24", az = "ap-northeast-2a", public = false }
    app-c = { cidr = "10.0.12.0/24", az = "ap-northeast-2c", public = false }
    db-a = { cidr = "10.0.21.0/24", az = "ap-northeast-2a", public = false}
    db-c = { cidr = "10.0.22.0/24", az = "ap-northeast-2c", public = false}
  }
}
variable "eks_cluster_name" {
  type = string
}