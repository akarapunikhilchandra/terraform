terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.16.1"
    }
  }
  backend "s3" {
    bucket = "roboshop-state-dev"
    key = "tfvars"
    region = "us-east-1"
    dynamodb_table = "roboshop-locking-dev"
  }
}
provider "aws" {
  # Configuration options
  region = "us-east-1"
}