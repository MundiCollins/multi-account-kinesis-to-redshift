resource "aws_iam_policy" "events_etl_s3_full" {
  name        = "events_etl_s3_full_access"
  path        = "/"
  description = "S3 Full access policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": [
        "${aws_s3_bucket.user_event_bucket.arn}",
        "${aws_s3_bucket.user_event_bucket.arn}/*",
        "${aws_s3_bucket.user_utm_bucket.arn}",
        "${aws_s3_bucket.user_utm_bucket.arn}/*"
      ]
        
    }
  ]
}
EOF
}

resource "aws_iam_policy" "events_etl_s3_readonly" {
  name        = "events_etl_s3_readonly_access"
  path        = "/"
  description = "S3 Readonly access policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:Get*",
        "s3:List*"
      ],
      "Effect": "Allow",
      "Resource": [
        "${aws_s3_bucket.user_event_bucket.arn}",
        "${aws_s3_bucket.user_event_bucket.arn}/*",
        "${aws_s3_bucket.user_utm_bucket.arn}",
        "${aws_s3_bucket.user_utm_bucket.arn}/*"
      ]
        
    }
  ]
}
EOF
}
