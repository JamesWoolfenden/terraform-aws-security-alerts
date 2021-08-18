
resource "aws_sns_topic_subscription" "Emailfromlambda" {
  topic_arn = aws_sns_topic.processed-message.arn
  protocol  = "email"
  endpoint  = var.endpoint
}
