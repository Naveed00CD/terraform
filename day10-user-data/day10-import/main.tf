resource "aws_instance" "testqw" {
 ami = "ami-062f0cc54dbfd8ef1"
 instance_type = "t2.micro"
 tags = {
   Name= "ec2_test_1"
}
  
}

