# resource "aws_instance" "day-4" {
#     ami =var.ami
#     instance_type = var.instance_type
  
# }
# resource "aws_vpc" "name" {
#   cidr_block = "10.0.0.0/16"
# #  depends_on = [ aws_instance.day-4 ]
  
#  }
#creating s3 bucket and dynamo DB for state backend storgae and applying the lock mechanisam for statefile
provider "aws" {
  
}

resource "aws_s3_bucket" "example" {
  bucket = "serxdcfvgbhjncgfhlk"
  
}

resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name = "navvedddk1k1k1"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20
 
  attribute {
    name = "LockID"
    type = "S"
  }
}