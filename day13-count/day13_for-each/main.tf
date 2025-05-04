variable "env" {
    type = list(string)
    default = [ "ec2_dev","ec2_test", "ec2_prod" ]

  
}

resource "aws_instance" "name" {
    ami ="ami-0081f0d5081b58505"
    instance_type = "t2.micro"
    for_each = toset(var.env)
    tags = {
        Name= "value"
    }
    }