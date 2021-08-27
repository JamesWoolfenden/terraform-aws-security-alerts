output "metrics" {
  description = "The metrics filters for the Alarms"
  value = [
    aws_cloudwatch_log_metric_filter.bucket_mod,
    aws_cloudwatch_log_metric_filter.cloudtrail_cfg,
    aws_cloudwatch_log_metric_filter.cmk,
    aws_cloudwatch_log_metric_filter.config_change,
    aws_cloudwatch_log_metric_filter.gateway,
    aws_cloudwatch_log_metric_filter.nacl,
    aws_cloudwatch_log_metric_filter.nomfa,
    aws_cloudwatch_log_metric_filter.policychange,
    aws_cloudwatch_log_metric_filter.root,
    aws_cloudwatch_log_metric_filter.routes,
    aws_cloudwatch_log_metric_filter.sg,
    aws_cloudwatch_log_metric_filter.signfail,
    aws_cloudwatch_log_metric_filter.unauth,
    aws_cloudwatch_log_metric_filter.vpc,
  ]
}

output "alarms" {
  description = "The alarms created"
  value = [
    aws_cloudwatch_metric_alarm.bucket_mod,
    aws_cloudwatch_metric_alarm.cloudtrail_cfg,
    aws_cloudwatch_metric_alarm.cmk,
    aws_cloudwatch_metric_alarm.config_change,
    aws_cloudwatch_metric_alarm.gateway,
    aws_cloudwatch_metric_alarm.nacl,
    aws_cloudwatch_metric_alarm.nomfa,
    aws_cloudwatch_metric_alarm.policychange,
    aws_cloudwatch_metric_alarm.root,
    aws_cloudwatch_metric_alarm.routes,
    aws_cloudwatch_metric_alarm.sg,
    aws_cloudwatch_metric_alarm.signfail,
    aws_cloudwatch_metric_alarm.unauth,
    aws_cloudwatch_metric_alarm.vpc,
  ]
}


output "lambda" {
  description = "The lambda"
  value       = aws_lambda_function.email
}

output "sns_topic_processed" {
  description = "The final SNS endpoint for a processed message"
  value       = aws_sns_topic.processed-message
}

output "sns_topic_subscription_lambda" {
  description = "The SNS subcription that pulls messages into being processed by the Lambda"
  value       = aws_sns_topic_subscription.lambda
}
