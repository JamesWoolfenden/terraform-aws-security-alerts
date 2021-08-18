resource "aws_cloudwatch_log_group" "processor" {
  # checkov:skip=CKV_AWS_158: Im ok with AWS managed on this
  name              = "/aws/lambda/message-processor"
  retention_in_days = 30
}
