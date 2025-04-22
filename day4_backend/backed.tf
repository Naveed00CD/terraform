
terraform {
  backend "s3" {
    bucket = "serxdcfvgbhjncgfh"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}