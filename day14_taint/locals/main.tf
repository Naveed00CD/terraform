locals {
  region       = "us-west-1"
  instance_type = "t2.micro"
  ami ="ami-0abcdef1234567890"
}

resource "aws_instance" "example" {
  ami           = local.ami
  instance_type = local.instance_type
#   region        = local.region
}
