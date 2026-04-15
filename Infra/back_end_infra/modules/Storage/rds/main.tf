# ──────────────────────────────
# 1. DB Subnet Group (프라이빗 서브넷만 포함)
# ───────────────────────────────
resource "aws_db_subnet_group" "this" {
  name       = "${var.name}-db-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = merge(
    {
      Name = "${var.name}-db-subnet-group"
    },
    var.extra_tags
  )
}

# ───────────────────────────────
# 2. (선택) Parameter Group (기본 설정)
# ───────────────────────────────
resource "aws_db_parameter_group" "this" {
  name   = "${var.name}-mysql80"
  family = "mysql8.0"

  # 예시: wait_timeout 살짝 늘림
  parameter {
    name  = "wait_timeout"
    value = "28800"
  }

  tags = merge(
    {
      Name = "${var.name}-mysql80"
    },
    var.extra_tags
  )
}

# ───────────────────────────────
# 3. RDS Instance (Free Tier)
# ───────────────────────────────
resource "aws_db_instance" "this" {
  identifier                 = "${var.name}-mysql"
  engine                     = var.engine
  engine_version             = var.engine_version
  instance_class             = var.instance_class
  allocated_storage          = var.allocated_storage
  max_allocated_storage      = var.max_allocated_storage
  storage_type               = var.storage_type
  storage_encrypted          = true

  # DB 이름 및 계정 정보
  db_name                    = var.db_name
  username                   = var.master_username
  password                   = var.master_password   # ← 네가 직접 지정한 비밀번호 사용

  # 네트워크 설정
  vpc_security_group_ids     = var.db_sg_id
  db_subnet_group_name       = aws_db_subnet_group.this.name
  publicly_accessible        = var.publicly_accessible
  port                       = var.port
  multi_az                   = false

  # 백업/유지보수 설정
  backup_retention_period    = var.backup_retention_period
  backup_window              = var.backup_window
  maintenance_window         = var.maintenance_window
  auto_minor_version_upgrade = var.auto_minor_version_upgrade

  # 삭제/보호 설정
  deletion_protection        = var.deletion_protection
  skip_final_snapshot        = var.skip_final_snapshot

  # 태그
  tags = merge(
    {
      Name        = "${var.name}-mysql"
      Environment = var.env
    },
    var.extra_tags
  )

  # 즉시 적용 (편의상)
  apply_immediately = true
}
