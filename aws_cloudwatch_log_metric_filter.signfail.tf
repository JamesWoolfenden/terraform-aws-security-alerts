resource "aws_cloudwatch_log_metric_filter" "signfail" {
  name           = "console_signin_failure_metric"
  pattern        = "{($.eventName = \"ConsoleLogin\") && ($.errorMessage = \"Failed authentication\") }"
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "console_signin_failure_metric"
    namespace = "CISBenchmark"
    value     = "1"
  }
}
