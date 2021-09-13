resource "aws_lambda_function" "user_event_processor" {
  count = terraform.workspace == "warehouse" ? 1 : 0

  filename      = "app.zip"
  function_name = "event_processor"
  handler       = "main.lambda_handler"
  role          = aws_iam_role.events_lambda.arn
  runtime       = "python3.8"
}

resource "aws_lambda_function" "user_utm_processor" {
  count = terraform.workspace == "warehouse" ? 1 : 0

  filename      = "app.zip"
  function_name = "event_processor"
  handler       = "main.lambda_handler"
  role          = aws_iam_role.events_lambda.arn
  runtime       = "python3.8"
}
