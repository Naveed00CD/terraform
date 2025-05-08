# resource "aws_instance" "testqw" {
#  ami = "ami-062f0cc54dbfd8ef1"
#  instance_type = "t2.micro"
#  tags = {
#    Name= "ec2_test_1"
# }
  
# }

resource "aws_instance" "garf" {
  ami = "ami-0e35ddab05955cf57"
  instance_type = "t2.micro"
}