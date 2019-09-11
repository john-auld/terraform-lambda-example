terraform {
  backend "s3" {
    bucket = "ja-terraform-backend-state"
    key    = "demo"
    region = "eu-west-2"
  }
}