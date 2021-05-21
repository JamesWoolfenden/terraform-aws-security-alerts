resource "aws_cloudwatch_log_metric_filter" "cmk" {
  name           = "disable_or_delete_cmk_changes_metric"
  pattern        = "{($.eventSource = kms.amazonaws.com) && (($.eventName=DisableKey)||($.eventName=ScheduleKeyDeletion)) }"
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "disable_or_delete_cmk_changes_metric"
    namespace = "CISBenchmark"
    value     = "1"
  }
}

/*
aws logs put-metric-filter
--log-group-name <cloudtrail_log_group_name>
--filter-name <disable_or_delete_cmk_changes_metric>
--metrictransformations metricName= <disable_or_delete_cmk_changes_metric>,
        metricNamespace='CISBenchmark',metricValue=1
--filter-pattern '{($.eventSource = kms.amazonaws.com) &&
        (($.eventName=DisableKey)||($.eventName=ScheduleKeyDeletion)) }'
*/
