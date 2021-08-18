output "metrics" {
  value = module.alerts.metrics
}

output "alarms" {
  value = module.alerts.alarms
}

output "lambda" {
  value = module.alerts.lambda
}

output "sns_topic_processed" {
  value = module.alerts.sns_topic_processed
}

output "sns_topic_subscription_lambda" {
  value = module.alerts.sns_topic_subscription_lambda
}
