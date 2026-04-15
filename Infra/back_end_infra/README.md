# 테라폼 AWS 실습 -
- AWS 사용자계정=Self-IaC

# 주의 사항: 
- .pem 키의 경우 콘솔에서 따로 생성
- subnet, sg, rtb, igw 생성 시 vpc 아이디 필수
- S3-State를 통해 리소스 상태 관리
- EKS의 접근이 private로 구현하면 AWS LoadBalancer Controller를 생성하는 eks-addon 코드를 따로 git에 저장 생성 후 bastion에서 코드를 받아 생성

# TODONE:
- Create EC2 Instance /25.10.31
- Create VPC, Subnet, sg /25.11.01
- Create IGW , rtb, multi Subnet /25.11.6
- Update Network Section -> Modulize and Create&Access DB-instance /25.11.12
- 네트워크 및 컴퓨트와 보안 그룹 생성 후 bastion -> web 으로 접속 성공 /25.11.13
- DB(free tier) 생성 및 접속 /26.03.08
- Create EKS & ALB Controller & IAM /26.03.14
- Config yaml & Create test_web and ECR /26.03.15
- deploy success /26.03.17
- S3 + CloudFront 생성 /26.3.19

# TODO:
- CloudWatch
