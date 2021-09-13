resource "aws_iam_group" "events_etl" {
  name = "events_etl"
  path = "/"
}

resource "aws_iam_group_policy_attachment" "assume_events_etl_role_attachment" {
  count      = length(aws_iam_policy.assume_events_etl_role)
  group      = aws_iam_group.events_etl.name
  policy_arn = element(aws_iam_policy.assume_events_etl_role.*.arn, count.index)
}
