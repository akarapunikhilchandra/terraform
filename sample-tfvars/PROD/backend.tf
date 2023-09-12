terraform {
  backend "s3" {
    bucket         = "roboshop-state-prod"
    key            = "prod"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "roboshop-lock-prod"
  }
}
