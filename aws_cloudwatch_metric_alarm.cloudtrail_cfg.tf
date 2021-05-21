resource "aws_cloudwatch_metric_alarm" "cloudtrail_cfg" {
  alarm_name          = "cloudtrail_cfg_changes_alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "cloudtrail_cfg_changes_metric"
  namespace           = "CISBenchmark"
  period              = 300
  statistic           = "Sum"
  threshold           = 1
  alarm_actions       = [aws_sns_topic.trail-unauthorised.arn]
}

/*
aws cloudwatch put-metric-alarm
--alarm-name <cloudtrail_cfg_changes_alarm>
--metric-name <cloudtrail_cfg_changes_metric>
--statistic Sum
--period 300
--threshold 1
--comparison-operator GreaterThanOrEqualToThreshold
--evaluation-periods 1 -namespace 'CISBenchmark'
--alarm-actions <sns_topic_arn>
*/
