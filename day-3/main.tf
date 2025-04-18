resource "aws_instance" "testk1" {
    ami =var.ami
    instance_type = var.instance_type
    key_name = "key01"
    tags = {
      Name="test-day3"
    }
  
}