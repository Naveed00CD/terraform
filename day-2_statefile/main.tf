resource "aws_instance" "test2k" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = "key01"
    tags= {
        Name="ec2"

    }
    
  
}