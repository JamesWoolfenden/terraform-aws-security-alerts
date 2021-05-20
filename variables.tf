
variable "endpoint" {
  type = string
}

variable "protocol" {
  type    = string
  default = "sms"
}

variable "log_group_name" {
  type    = string
  default = "cloudtrail"
}

variable "kms_key" {
  type    = string
  default = "alias/aws/sns"
}
