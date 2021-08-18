resource "aws_sns_topic" "processed-message" {
  name              = "processedmessage"
  kms_master_key_id = var.kms_key
}
