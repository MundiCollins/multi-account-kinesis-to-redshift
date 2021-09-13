resource "aws_s3_bucket_notification" "user_event_bucket_notification" {
  count = terraform.workspace == "warehouse" ? 1 : 0

  bucket = aws_s3_bucket.user_event_bucket.id

  lambda_function {
    lambda_function_arn = aws_lambda_function.user_event_processor[count.index].arn
    events              = ["s3:ObjectCreated:*"]
    filter_suffix       = ".json"
  }

  depends_on = [aws_lambda_permission.allow_user_event_bucket]
}

resource "aws_s3_bucket_notification" "user_utm_bucket_notification" {
  count = terraform.workspace == "warehouse" ? 1 : 0

  bucket = aws_s3_bucket.user_utm_bucket.id

  lambda_function {
    lambda_function_arn = aws_lambda_function.user_utm_processor[count.index].arn
    events              = ["s3:ObjectCreated:*"]
    filter_suffix       = ".json"
  }

  depends_on = [aws_lambda_permission.allow_user_utm_bucket]
}
