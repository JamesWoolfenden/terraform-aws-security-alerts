resource "aws_cloudwatch_log_metric_filter" "nacl" {
  name           = "nacl_changes_metric"
  pattern        = <<PATTERN
{($.eventName = CreateNetworkAcl) ||
($.eventName = CreateNetworkAclEntry) ||
($.eventName = DeleteNetworkAcl) ||
($.eventName = DeleteNetworkAclEntry) ||
($.eventName = ReplaceNetworkAclEntry) ||
($.eventName = ReplaceNetworkAclAssociation) }
PATTERN
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "nacl_changes_metric"
    namespace = "CISBenchmark"
    value     = "1"
  }
}

/*
aws logs put-metric-filter
--log-group-name <cloudtrail_log_group_name>
--filter-name <nacl_changes_metric>
--metric-transformations metricName=<nacl_changes_metric>,
        metricNamespace='CISBenchmark',metricValue=1
--filter-pattern '{ ($.eventName = CreateNetworkAcl) ||
        ($.eventName = CreateNetworkAclEntry) ||
        ($.eventName = DeleteNetworkAcl) ||
        ($.eventName = DeleteNetworkAclEntry) ||
        ($.eventName = ReplaceNetworkAclEntry) ||
        ($.eventName = ReplaceNetworkAclAssociation) }'
*/
