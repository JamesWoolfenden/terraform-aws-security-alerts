resource "aws_sns_topic_subscription" "lambda" {
  topic_arn = aws_sns_topic.trail-unauthorised.arn
  protocol  = "lambda"
  endpoint  = aws_lambda_function.email.arn
}
