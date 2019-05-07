provider "aws" {
  profile = "default"
  region = "eu-west-1"
}

resource "aws_s3_bucket" "bucket" {
  bucket = "terraformbackend-guru"
}
