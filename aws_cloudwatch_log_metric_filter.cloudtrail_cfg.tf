resource "aws_cloudwatch_log_metric_filter" "cloudtrail_cfg" {
  name           = "cloudtrail_cfg_changes_metric"
  pattern        = "{($.eventName = CreateTrail) || ($.eventName = UpdateTrail) || ($.eventName = DeleteTrail) || ($.eventName = StartLogging) || ($.eventName = StopLogging)}"
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "cloudtrail_cfg_changes_metric"
    namespace = "CISBenchmark"
    value     = "1"
  }
}

/*
aws logs put-metric-filter
--log-group-name <cloudtrail_log_group_name>
--filter-name <cloudtrail_cfg_changes_metric>
--metric-transformations metricName= <cloudtrail_cfg_changes_metric>,
        metricNamespace='CISBenchmark',metricValue=1
--filter-pattern '{($.eventName = CreateTrail) || ($.eventName = UpdateTrail) ||
        ($.eventName = DeleteTrail) || ($.eventName = StartLogging) ||
        ($.eventName = StopLogging)}'*/
