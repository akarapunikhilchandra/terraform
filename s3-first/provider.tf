terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.16.1"
    }
  }
  backend "s3" {
    bucket = "roboshop-state"
    key = "firsts3"
    region = "us-east-1"
    dynamodb_table = "roboshop-locking"
  }
}
provider "aws" {
  # Configuration options
  region = "us-east-1"
}