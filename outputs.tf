output "metrics" {
  value = [
    aws_cloudwatch_log_metric_filter.nomfa,
    aws_cloudwatch_log_metric_filter.signfail,
    aws_cloudwatch_log_metric_filter.unauth
  ]
}

output "alarms" {
  value = [
    aws_cloudwatch_metric_alarm.nomfa,
    aws_cloudwatch_metric_alarm.signfail,
    aws_cloudwatch_metric_alarm.unauth
  ]
}
