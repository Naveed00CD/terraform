provider "aws" {
  region = "ap-south-1"  # Change to your desired region
}

resource "aws_s3_bucket" "MyS3Bucket" {
  bucket = var.bucket_name  # Must be globally unique
  acl    = var.acl

  tags = {
    Environment = var.Environment
  }
}
