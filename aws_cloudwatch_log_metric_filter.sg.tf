resource "aws_cloudwatch_log_metric_filter" "sg" {
  name           = "security_group_changes_metric"
  pattern        = <<PATTERN
{($.eventName = AuthorizeSecurityGroupIngress) ||
($.eventName = AuthorizeSecurityGroupEgress) ||
($.eventName = RevokeSecurityGroupIngress) ||
($.eventName = RevokeSecurityGroupEgress) ||
($.eventName = CreateSecurityGroup) ||
($.eventName = DeleteSecurityGroup) }
  PATTERN
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "security_group_changes_metric"
    namespace = "CISBenchmark"
    value     = "1"
  }
}

/*
aws logs put-metric-filter
--log-group-name <cloudtrail_log_group_name>
--filter-name <security_group_changes_metric>
--metric-transformationsmetricName= <security_group_changes_metric>,
        metricNamespace='CISBenchmark',metricValue=1
--filter-pattern '{($.eventName = AuthorizeSecurityGroupIngress) ||
        ($.eventName = AuthorizeSecurityGroupEgress) ||
        ($.eventName = RevokeSecurityGroupIngress) ||
        ($.eventName = RevokeSecurityGroupEgress) ||
        ($.eventName = CreateSecurityGroup) ||
        ($.eventName = DeleteSecurityGroup) }' */
