resource "aws_cloudwatch_log_metric_filter" "gateway" {
  name           = "gateway_changes_metric"
  pattern        = <<PATTERN
{ ($.eventName = CreateCustomerGateway) ||
($.eventName = DeleteCustomerGateway) || ($.eventName = AttachInternetGateway) ||
($.eventName = CreateInternetGateway) || ($.eventName = DeleteInternetGateway) ||
($.eventName = DetachInternetGateway) }
PATTERN
  log_group_name = var.log_group_name
  metric_transformation {
    name      = "gateway_changes_metric"
    namespace = "CISBenchmark"
    value     = "1"
  }
}
