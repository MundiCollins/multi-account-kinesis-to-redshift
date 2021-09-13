resource "aws_lambda_function" "user_event_processor" {
  count = terraform.workspace == "warehouse" ? 1 : 0

  filename      = "app.zip"
  function_name = "event_processor"
  handler       = "main.lambda_handler"
  role          = aws_iam_role.events_lambda[count.index].arn
  runtime       = "python3.8"
}

resource "aws_lambda_function" "user_utm_processor" {
  count = terraform.workspace == "warehouse" ? 1 : 0

  filename      = "app.zip"
  function_name = "event_processor"
  handler       = "main.lambda_handler"
  role          = aws_iam_role.events_lambda[count.index].arn
  runtime       = "python3.8"
}

resource "aws_lambda_permission" "allow_user_event_bucket" {
  count = terraform.workspace == "warehouse" ? 1 : 0

  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.user_event_processor[count.index].arn
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.user_event_bucket.arn
}

resource "aws_lambda_permission" "allow_user_utm_bucket" {
  count = terraform.workspace == "warehouse" ? 1 : 0

  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.user_utm_processor[count.index].arn
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.user_utm_bucket.arn
}
