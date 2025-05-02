# resource "aws_instance" "name" {
#     ami = "ami-0081f0d5081b58505"
#     instance_type = "t2.micro"
#     # key_name = "ec2test"
#     availability_zone = "us-east-1a"
#     user_data = file("test.sh")

# }

resource "aws_instance" "testQk" {
    ami = "ami-0081f0d5081b58505"
    instance_type = "t2.micro"
    availability_zone = "ap-south-1"
    user_data = file("test.sh")#to mention file or sricpt
    tags= {
        name="ec2_k"
  
  }
}


resource "aws_instance" "example" {
  ami               = "ami-0081f0d5081b58505"  # Amazon Linux 2 in ap-south-1
  instance_type     = "t2.micro"
  availability_zone = "ap-south-1a"  # Must be a specific AZ (1a, 1b, or 1c)
  user_data         = file("test.sh")  # Runs script at launch

  tags = {
    Name = "ec2_k"  # AWS console displays "Name" (case-sensitive)
  }
}



resource "aws_s3_bucket" "s3tf" {
  bucket = "serxdcfvgbhjncgfhlk"
}