resource "aws_s3_bucket" "user_event_bucket" {
  bucket = "user-event"
  acl    = "private"
}

resource "aws_s3_bucket" "user_utm_bucket" {
  bucket = "user-utm"
  acl    = "private"
}

output "user_event_bucket_arn" {
  value = aws_s3_bucket.user_event_bucket.arn
}

output "user_utm_bucket_arn" {
  value = aws_s3_bucket.user_utm_bucket.arn
}
