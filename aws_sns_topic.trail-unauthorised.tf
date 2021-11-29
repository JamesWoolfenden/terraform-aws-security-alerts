resource "aws_sns_topic" "trail-unauthorised" {
  name                             = "Unauthorised"
  kms_master_key_id                = aws_kms_key.alarm.id
  lambda_success_feedback_role_arn = aws_iam_role.SNSSuccessFeedback.arn
  lambda_failure_feedback_role_arn = aws_iam_role.SNSFailureFeedback.arn
}
