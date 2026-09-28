resource "aws_ecr_repository" "app" {
  name                 = "test_web"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  # 암호화 구성
  encryption_configuration {
    encryption_type = "AES256"
  }

  tags = {
    Name        = "test_web"
    Environment = "dev"
    Terraform   = "true"
  }
}

# 생명주기
resource "aws_ecr_lifecycle_policy" "app_lifecycle" {
  repository = aws_ecr_repository.app.name

  policy = jsonencode({
    rules = [
      {
        rulePriority = 1
        description  = "Keep last 10 images"
        selection = {
          tagStatus   = "any"
          countType   = "imageCountMoreThan"
          countNumber = 10
        }
        action = {
          type = "expire"
        }
      }
    ]
  })
}