# resource "aws_instance" "ec2count"{

#     ami = "ami-0081f0d5081b58505"
#     instance_type = "t2.micro"
#     count = 2
#     tags = {
#         Name ="ec2-${count.index}"

#     }
# }


# # variable "ami1" {
# #     type = string
# #     default = "ami-0081f0d5081b58505"
  
# # }

variable "env" {
    type = list(string)
    default = [ "ec2_dev","ec2_test", "ec2_prod" ]

  
}

resource "aws_instance" "name" {
    ami ="ami-0081f0d5081b58505"
    instance_type = "t2.micro"
    count = length(var.env)
    tags = {
        Name= var.env[count.index]
    }
  
}