#the AWS Terraform provider
terraform {
 required_providers {
  aws = {
   source = "hashicorp/aws"
  }
 }
}

provider "aws" {

access_key = "AKIAZQVBIRRCPG4DRTGA"

secret_key = "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"

region = "us-east-1"
}
