resource "aws_cloudwatch_log_metric_filter" "root" {
  name           = "root_usage_metric"
  pattern        = "{ $.userIdentity.type = \"Root\" && $.userIdentity.invokedBy NOT EXISTS && $.eventType != \"AwsServiceEvent\" }"
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "root_usage_metric"
    namespace = "CISBenchmark"
    value     = "1"
  }
}
