resource "aws_cloudwatch_log_metric_filter" "config_change" {
  name           = "aws_config_changes_metric"
  pattern        = "{($.eventSource = config.amazonaws.com) && (($.eventName=StopConfigurationRecorder)||($.eventName=DeleteDeliveryChannel)|| ($.eventName=PutDeliveryChannel)||($.eventName=PutConfigurationRecorder))}"
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "aws_config_changes_metric"
    namespace = "CISBenchmark"
    value     = "1"
  }
}

/*
aws logs put-metric-filter
--log-group-name <cloudtrail_log_group_name>
--filter-name <aws_config_changes_metric>
--metric-transformationsmetricName= <aws_config_changes_metric>,
        metricNamespace='CISBenchmark',metricValue=1
--filter-pattern '{($.eventSource = config.amazonaws.com) &&
        (($.eventName=StopConfigurationRecorder)||($.eventName=DeleteDeliveryChannel)||
        ($.eventName=PutDeliveryChannel)||($.eventName=PutConfigurationRecorder))}'
*/
