resource "aws_kinesis_firehose_delivery_stream" "user_event_stream" {
  count = terraform.workspace == "streaming" ? 1 : 0

  name        = "kinesis-firehose-extended-s3-user-event-stream"
  destination = "extended_s3"

  extended_s3_configuration {
    role_arn   = aws_iam_role.events_firehose.arn
    bucket_arn = aws_s3_bucket.user_event_bucket.arn
  }
}

resource "aws_kinesis_firehose_delivery_stream" "user_utm_stream" {
  count = terraform.workspace == "streaming" ? 1 : 0

  name        = "kinesis-firehose-extended-s3-user-utm-stream"
  destination = "extended_s3"

  extended_s3_configuration {
    role_arn   = aws_iam_role.events_firehose.arn
    bucket_arn = aws_s3_bucket.user_utm_bucket.arn
  }
}
