provider "aws" {
    region = "ap-south-1"
  
}




data "aws_subnet" "name" {
    filter {
      name = "tag:name"
      values = ["PUB"]
    }
  
}

data "aws_vpc" "name" {
    filter {
      name = "tag:name"
      values = ["VPC A"]
    }
  
}

resource "aws_instance" "name" {
    ami="ami-0081f0d5081b58505"
    instance_type = "t2.micro"
     subnet_id = data.aws_subnet.name.id

  
}