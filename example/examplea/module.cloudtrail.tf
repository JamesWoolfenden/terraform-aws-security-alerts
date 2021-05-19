module "cloudtrail" {
  source      = "JamesWoolfenden/cloudtrail/aws"
  version     = "0.1.40"
  common_tags = var.common_tags
  trail = {
    name                          = "tf-trail-account"
    s3_key_prefix                 = "prefix"
    include_global_service_events = true
  }
}
