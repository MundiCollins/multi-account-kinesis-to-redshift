variable "aws_account_id" {
  type = string
}

variable "aws_profile" {
  type = string
}

variable "aws_region" {
  type = string
}

variable "aws_account_ids" {
  type = map(any)
}
