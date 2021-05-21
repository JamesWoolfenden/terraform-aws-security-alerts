resource "aws_cloudwatch_log_metric_filter" "policychange" {
  name           = "iam_changes_metric"
  pattern        = <<PATTERN
   "($.eventName=DeleteGroupPolicy)||($.eventName=DeleteRolePolicy)||
    ($.eventName=DeleteUserPolicy)||($.eventName=PutGroupPolicy)||
    ($.eventName=PutRolePolicy)||($.eventName=PutUserPolicy)||
    ($.eventName=CreatePolicy)||($.eventName=DeletePolicy)||
    ($.eventName=CreatePolicyVersion)||($.eventName=DeletePolicyVersion)||
    ($.eventName=AttachRolePolicy)||($.eventName=DetachRolePolicy)||
    ($.eventName=AttachUserPolicy)||($.eventName=DetachUserPolicy)||
    ($.eventName=AttachGroupPolicy)||($.eventName=DetachGroupPolicy)}"
  PATTERN
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "iam_changes_metric"
    namespace = "CISBenchmark"
    value     = "1"
  }
}
/*
aws logs put-metric-filter
--log-group-name <cloudtrail_log_group_name>
--filter-name <iam_changes_metric>
--metric-transformations metricName=<iam_changes_metric>,
        metricNamespace='CISBenchmark', metricValue=1
--filter-pattern '{($.eventName=DeleteGroupPolicy)||($.eventName=DeleteRolePolicy)||
        ($.eventName=DeleteUserPolicy)||($.eventName=PutGroupPolicy)||
        ($.eventName=PutRolePolicy)||($.eventName=PutUserPolicy)||
        ($.eventName=CreatePolicy)||($.eventName=DeletePolicy)||
        ($.eventName=CreatePolicyVersion)||($.eventName=DeletePolicyVersion)||
        ($.eventName=AttachRolePolicy)||($.eventName=DetachRolePolicy)||
        ($.eventName=AttachUserPolicy)||($.eventName=DetachUserPolicy)||
        ($.eventName=AttachGroupPolicy)||($.eventName=DetachGroupPolicy)}'*/
