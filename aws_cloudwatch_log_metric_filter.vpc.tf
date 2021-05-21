resource "aws_cloudwatch_log_metric_filter" "vpc" {
  name           = "vpc_changes_metric"
  pattern        = <<PATTERN
{ ($.eventName = CreateVpc) || ($.eventName = DeleteVpc) ||  ($.eventName = ModifyVpcAttribute) ||
  ($.eventName = AcceptVpcPeeringConnection) || ($.eventName = CreateVpcPeeringConnection) ||
  ($.eventName = DeleteVpcPeeringConnection) || ($.eventName = RejectVpcPeeringConnection) ||
  ($.eventName = AttachClassicLinkVpc) || ($.eventName = DetachClassicLinkVpc) ||
  ($.eventName = DisableVpcClassicLink) || ($.eventName = EnableVpcClassicLink) }
PATTERN
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "vpc_changes_metric"
    namespace = "CISBenchmark"
    value     = "1"
  }
}
/*
aws logs put-metric-filter
--log-group-name <cloudtrail_log_group_name>
--filter-name <vpc_changes_metric>
--metric-transformations metricName=<vpc_changes_metric>,
        metricNamespace='CISBenchmark',metricValue=1
--filter-pattern '{ ($.eventName = CreateVpc) || ($.eventName = DeleteVpc) ||
        ($.eventName = ModifyVpcAttribute) ||
        ($.eventName = AcceptVpcPeeringConnection) ||
        ($.eventName = CreateVpcPeeringConnection) ||
        ($.eventName = DeleteVpcPeeringConnection) ||
        ($.eventName = RejectVpcPeeringConnection) ||
        ($.eventName = AttachClassicLinkVpc) || ($.eventName = DetachClassicLinkVpc) ||
        ($.eventName = DisableVpcClassicLink) || ($.eventName = EnableVpcClassicLink) }'
*/
