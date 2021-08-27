
variable "endpoint" {
  type        = string
  description = "The endpoint that the protocol is using"
  default     = "jwoolfenden@paloaltonetworks.com"
}


variable "protocol" {
  type        = string
  description = "The protocol that SNS subscription uses"
  default     = "email"
}
