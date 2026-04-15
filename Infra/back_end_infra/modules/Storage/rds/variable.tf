# ─────────────────────────────────────────────
# variables.tf — Free Tier RDS (MySQL) 기본 변수
# ─────────────────────────────────────────────
variable "name" {
  description = "리소스 접두사 (예: 프로젝트/스택 이름)"
  type        = string
  default     = "demo"
}

variable "env" {
  description = "환경 태그 (dev/stage/prod 등)"
  type        = string
  default     = "dev"
}

# VPC/서브넷
variable "vpc_id" {
  description = "RDS가 속할 VPC ID"
  type        = string
}

variable "private_subnet_ids" {
  description = "RDS DB Subnet Group에 사용할 프라이빗 서브넷 ID 목록(2개 권장)"
  type        = list(string)
}

# 보안 그룹 (이미 위에서 만든 db-sg의 ID 사용)
variable "db_sg_id" {
  description = "RDS에 적용할 DB Security Group ID"
  type        = list(string)
}

# 엔진/버전
variable "engine" {
  description = "RDS 엔진 (MySQL 기준)"
  type        = string
  default     = "mysql"
}

variable "engine_version" {
  description = "엔진 버전 (예: 8.0 또는 8.0.36 처럼 고정)"
  type        = string
  default     = "8.0"
}

# Free Tier 사양
variable "instance_class" {
  description = "인스턴스 타입 (Free Tier: db.t3.micro)"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "스토리지(GB) — Free Tier 권장: 20GB"
  type        = number
  default     = 20
}

variable "max_allocated_storage" {
  description = "(옵션) 스토리지 자동 확장 상한(GB). 0이면 비활성화"
  type        = number
  default     = 100
}

variable "storage_type" {
  description = "스토리지 타입 (gp3 권장)"
  type        = string
  default     = "gp3"
}

# DB 기본 스키마/계정
variable "db_name" {
  description = "생성할 기본 DB 이름"
  type        = string
  default     = "appdb"
}

variable "master_username" {
  description = "마스터 사용자명"
  type        = string
  default     = "admin"
}

variable "master_password" {
  description = "RDS 마스터 비밀번호 (8~41자, 영문/숫자/특수문자 조합 권장)"
  type        = string
  sensitive   = true  # terraform plan/apply 출력에 표시되지 않음
  default = "lee15946"
}


# 네트워크/공개 여부
variable "publicly_accessible" {
  description = "퍼블릭 접근 허용 여부 (프라이빗 RDS이므로 false)"
  type        = bool
  default     = false
}

variable "port" {
  description = "DB 포트"
  type        = number
  default     = 3306
}

# 백업/유지보수
variable "backup_retention_period" {
  description = "백업 보존일수 (개발/프리티어: 7 권장)"
  type        = number
  default     = 7
}

variable "backup_window" {
  description = "백업 시간창 (UTC, 예: 17:00-18:00)"
  type        = string
  default     = "17:00-18:00"
}

variable "maintenance_window" {
  description = "유지보수 시간창 (UTC, 예: Sun:18:00-Sun:19:00)"
  type        = string
  default     = "Sun:18:00-Sun:19:00"
}

variable "auto_minor_version_upgrade" {
  description = "마이너 버전 자동 업데이트"
  type        = bool
  default     = true
}

# 운영 편의(개발용 기본값)
variable "deletion_protection" {
  description = "삭제 보호"
  type        = bool
  default     = false
}

variable "skip_final_snapshot" {
  description = "삭제 시 최종 스냅샷 생략 (개발편의: true)"
  type        = bool
  default     = true
}

# 태그
variable "extra_tags" {
  description = "추가 태그 맵"
  type        = map(string)
  default     = {}
}