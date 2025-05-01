provider "aws" {
    region = "ap-south-1"
  
}


module "web_instance" {

    source = "./day9_child_module/ec2"
    ami = "ami-0081f0d5081b58505"
    instance_type = "t2.micro"
  
}

module "s3"{
    source = "./day9_child_module/s3"

    bucket_name= "aefstybhenjakmsdcuiads45"


    Environment = "Dev"
}

# Parent Module
# module "aws_s3_bucket" {  # Correct module name (matches child directory)
#   source   = "./day9_child_module/s3"  # Verify path is correct
#   bucket   = "aefstybhenjakmsdcuiads45"  # Passed to child's `var.bucket`
#   tags = {  # Passed to child's `var.tags`
#     Name        = "MyS3Bucket"
#     Environment = "Dev"
#   }
# }

