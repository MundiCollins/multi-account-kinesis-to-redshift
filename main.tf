module "s3" {
  source = "/main/"
}

module "kinesis" {
  source = "/environments/"

  user_event_bucket_arn = module.s3.user_event_bucket_arn
  user_utm_bucket_arn = module.s3.user_utm_bucket_arn
}
