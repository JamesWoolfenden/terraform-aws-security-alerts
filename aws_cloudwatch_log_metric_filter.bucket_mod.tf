resource "aws_cloudwatch_log_metric_filter" "bucket_mod" {
  name           = "s3_bucket_policy_changes_metric"
  pattern        = <<PATTERN
{($.eventSource = s3.amazonaws.com) && (($.eventName = PutBucketAcl) ||
($.eventName = PutBucketPolicy) || ($.eventName = PutBucketCors) ||
($.eventName = PutBucketLifecycle) || ($.eventName = PutBucketReplication) ||
($.eventName = DeleteBucketPolicy) || ($.eventName = DeleteBucketCors) ||
($.eventName = DeleteBucketLifecycle) || ($.eventName =DeleteBucketReplication)) }
PATTERN
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "s3_bucket_policy_changes_metric"
    namespace = "CISBenchmark"
    value     = "1"
  }
}


/*
aws logs put-metric-filter
--log-group-name <cloudtrail_log_group_name>
--filter-name <s3_bucket_policy_changes_metric>
--metric-transformationsmetricName= <s3_bucket_policy_changes_metric>,
        metricNamespace='CISBenchmark',metricValue=1
--filter-pattern '{
        ($.eventSource = s3.amazonaws.com) && (($.eventName = PutBucketAcl) ||
        ($.eventName = PutBucketPolicy) || ($.eventName = PutBucketCors) ||
        ($.eventName = PutBucketLifecycle) || ($.eventName = PutBucketReplication) ||
        ($.eventName = DeleteBucketPolicy) || ($.eventName = DeleteBucketCors) ||
        ($.eventName = DeleteBucketLifecycle) || ($.eventName =
        DeleteBucketReplication)) }'
*/
