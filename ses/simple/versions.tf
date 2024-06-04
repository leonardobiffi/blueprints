terraform {
  required_version = ">= 1.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.46"
    }
    awsutils = {
      source  = "cloudposse/awsutils"
      version = "~> 0.16"
    }
  }
}
