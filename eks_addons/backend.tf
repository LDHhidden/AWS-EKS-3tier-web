terraform {
  backend "s3" {
    bucket       = "eks-addon-state-bucket"
    key          = "env/dev/alb_controller/terraform.tfstate"
    region       = "ap-northeast-2"
    use_lockfile = true
  }
}