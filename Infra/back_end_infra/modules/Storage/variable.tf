variable "vpc_id"{
  type = string
}
variable "private_subnet_ids" {
  type = list(string)
}
variable "db_sg_id" {
  type = list(string)
}