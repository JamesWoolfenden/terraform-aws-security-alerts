# you can't use a managed key to write to an encrypted SNS from a cloudwatch alarm
resource "aws_kms_key" "alarm" {
  policy              = <<POLICY
{
    "Version": "2012-10-17",
    "Id": "key-consolepolicy-3",
    "Statement": [
        {
            "Sid": "Allow_CloudWatch_for_CMK",
            "Effect": "Allow",
            "Principal": {
                "Service": "cloudwatch.amazonaws.com"
            },
            "Action": [
                "kms:Decrypt",
                "kms:GenerateDataKey*"
            ],
            "Resource": "*"
        },
        {
            "Sid": "Enable IAM User Permissions",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
            },
            "Action": "kms:*",
            "Resource": "*"
        }
    ]
}
POLICY
  enable_key_rotation = true
}


resource "aws_kms_alias" "alarm" {
  target_key_id = aws_kms_key.alarm.id
  name          = var.kms-alias
}

data "aws_caller_identity" "current" {}

variable "kms-alias" {
  type    = string
  default = "alias/alarms"
}
