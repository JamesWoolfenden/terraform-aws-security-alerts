resource "aws_cloudwatch_log_metric_filter" "nomfa" {
  name           = "no_mfa_console_signin_metric"
  pattern        = "{($.eventName = \"ConsoleLogin\") && ($.additionalEventData.MFAUsed != \"Yes\")}"
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "no_mfa_console_signin_metric"
    namespace = "CISBenchmark"
    value     = "1"
  }
}
