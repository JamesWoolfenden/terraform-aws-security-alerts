resource "aws_cloudwatch_metric_alarm" "signfail" {
  alarm_name          = "console_signin_failure_alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "console_signin_failure_metric"
  namespace           = "CISBenchmark"
  period              = 300
  statistic           = "Sum"
  threshold           = 1
  alarm_actions       = [aws_sns_topic.trail-unauthorised.arn]
}
