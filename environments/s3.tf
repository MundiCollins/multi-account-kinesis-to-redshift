resource "aws_s3_bucket" "user_event_bucket" {
  bucket = "user-event"
  acl    = "private"
}

resource "aws_s3_bucket" "user_utm_bucket" {
  bucket = "user-utm"
  acl    = "private"
}
