resource "aws_cloudwatch_log_metric_filter" "unauth" {
  name           = "unauthorized_api_calls_metric"
  pattern        = "{($.errorCode = \"*UnauthorizedOperation\") || ($.errorCode = \"AccessDenied*\")}"
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "unauthorized_api_calls_metric"
    namespace = "CISBenchmark"
    value     = "1"
  }
}
