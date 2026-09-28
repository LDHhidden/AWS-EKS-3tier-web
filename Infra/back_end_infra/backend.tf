terraform {
  backend "s3" {
    bucket       = "tfstate-bucket-20260915201510705100000001"
    key          = "env/dev/eks/terraform.tfstate"
    region       = "ap-northeast-2"
    use_lockfile = true
  }
}