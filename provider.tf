#the AWS Terraform provider
terraform {
 required_providers {
  aws = {
   source = "hashicorp/aws"
  }
 }
}

provider "aws" {

access_key = "xxxxxxxxxxxxxxxxxxxx"

secret_key = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

region = "us-east-1"
}
