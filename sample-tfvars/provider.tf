terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.16.1"
    }
  }
  backend "s3" {
    bucket         = "roboshop-state-dev"
    key            = "dev"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "roboshop-lock-dev"
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}