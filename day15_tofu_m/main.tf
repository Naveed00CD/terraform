# resource "aws_instance" "my_instance" {
#   ami           = var.ami
#   instance_type = var.instance_type
#   tags = {
#     Name="terrafrm_test"
#   }
# }

resource "aws_instance" "webk1" {
    ami="ami-062f0cc54dbfd8ef1"
    instance_type = "t2.medium"
    subnet_id= "subnet-0d69e6690e3acc82c"

    tags= {
              Name= "web"
  
}
}