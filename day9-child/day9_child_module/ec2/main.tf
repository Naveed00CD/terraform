provider "aws" {
  region = "us-east-1"  # You can change this as needed
}

resource "aws_instance" "example" {
  ami          = var.ami# Amazon Linux 2 AMI for us-east-1 (update for your region)
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}
