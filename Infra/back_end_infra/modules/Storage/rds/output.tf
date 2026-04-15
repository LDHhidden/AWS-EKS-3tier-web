output "rds_endpoint" {
  description = "RDS 접속 엔드포인트"
  value       = aws_db_instance.this.endpoint
}

output "rds_address" {
  description = "RDS 주소"
  value       = aws_db_instance.this.address
}

output "rds_port" {
  description = "DB 포트"
  value       = aws_db_instance.this.port
}

output "db_name" {
  description = "DB 이름"
  value       = var.db_name
}

output "db_username" {
  description = "DB 마스터 사용자명"
  value       = var.master_username
}

output "db_sg_id" {
  description = "적용된 DB Security Group ID"
  value       = var.db_sg_id
}
