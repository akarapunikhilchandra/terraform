terraform {
  backend "s3" {
    bucket         = "roboshop-state-dev"
    key            = "dev"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "roboshop-lock-dev"
  }
}
