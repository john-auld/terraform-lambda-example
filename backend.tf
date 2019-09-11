terraform {
  backend "s3" {
    bucket = "terraform-backend-state-ja"
    key    = "bjss"
    region = "eu-west-2"
  }
}