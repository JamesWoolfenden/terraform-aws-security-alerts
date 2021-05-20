resource "aws_sns_topic" "trail-unauthorised" {
  name              = "Unauthorised"
  kms_master_key_id = var.kms_key
}

resource "aws_sns_topic_subscription" "sms" {
  topic_arn = aws_sns_topic.trail-unauthorised.arn
  protocol  = var.protocol
  endpoint  = var.endpoint
}
