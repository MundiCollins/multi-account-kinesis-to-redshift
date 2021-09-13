module "s3" {
  source = "/main/"
}

module "environments" {
  source = "/environments/"

  user_event_bucket_arn = module.s3.user_event_bucket_arn
  user_event_bucket_id  = module.s3.user_event_bucket_id
  user_utm_bucket_arn   = module.s3.user_utm_bucket_arn
  user_utm_bucket_id    = module.s3.user_utm_bucket_id
}
