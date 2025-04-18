resource "aws_instance" "day-4" {
    ami =var.ami
    instance_type = var.instance_type
  
}
