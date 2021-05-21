resource "aws_cloudwatch_log_metric_filter" "routes" {
  name           = "route_table_changes_metric"
  pattern        = <<PATTERN
{($.eventName = CreateRoute) || ($.eventName = CreateRouteTable) ||
($.eventName = ReplaceRoute) || ($.eventName = ReplaceRouteTableAssociation)||
($.eventName = DeleteRouteTable) || ($.eventName = DeleteRoute) ||
($.eventName = DisassociateRouteTable) }
PATTERN
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "route_table_changes_metric"
    namespace = "CISBenchmark"
    value     = "1"
  }
}

/*
aws logs put-metric-filter
--log-group-name <cloudtrail_log_group_name>
--filter-name <route_table_changes_metric>
--metric-transformationsmetricName= <route_table_changes_metric>,
        metricNamespace='CISBenchmark',metricValue=1
--filter-pattern '{($.eventName = CreateRoute) || ($.eventName = CreateRouteTable) ||
        ($.eventName = ReplaceRoute) || ($.eventName = ReplaceRouteTableAssociation)||
        ($.eventName = DeleteRouteTable) || ($.eventName = DeleteRoute) ||
        ($.eventName = DisassociateRouteTable) }'
*/
