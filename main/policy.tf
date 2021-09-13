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

resource "aws_iam_policy" "assume_events_etl_role" {
  count       = length(var.aws_account_ids)
  name        = "assume_${element(keys(var.aws_account_ids), count.index)}_events_etl_role"
  path        = "/"
  description = "Allows assuming a role in the ${element(keys(var.aws_account_ids), count.index)} environment"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "sts:AssumeRole",
      "Resource": "arn:aws:iam::${lookup(var.aws_account_ids, element(keys(var.aws_account_ids), count.index))}:role/events_etl"
    }
  ]
}
EOF
}
