resource "aws_instance" "day-4" {
    ami =var.ami
    instance_type = var.instance_type
  
}
resource "aws_vpc" "name" {
  cidr_block = "10.0.0.0/16"
  depends_on = [ aws_instance.dev ]
  
}