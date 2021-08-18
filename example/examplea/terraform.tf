terraform {
  required_providers {
    aws = {
      version = "3.51.0"
      source  = "hashicorp/aws"
    }
    archive = {
      version = "2.2.0"
      source  = "hashicorp/archive"
    }
  }
  required_version = ">=0.14.8"
}
