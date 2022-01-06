terraform {
 required_version = ">=0.12"
  backend "s3" {
    bucket="remote-test-terraform"
    key = "remote-demo.tfstate"
    region = "us-east-1"
    dynamodb_table = "s3-state-lock"
  }
}