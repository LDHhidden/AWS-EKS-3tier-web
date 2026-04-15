module "s3" {
  source      = "./s3"
  bucket_name = "hybrid-front-dev-730335535410"
  environment = "dev"
}

module "cloudfront" {
  source                        = "./cloudfront"
  project_name                  = "hybrid-web-system"
  environment                   = "dev"
  s3_bucket_id                  = module.s3.bucket_name
  s3_bucket_arn                 = module.s3.bucket_arn
  s3_bucket_regional_domain_name = module.s3.bucket_regional_domain_name
}