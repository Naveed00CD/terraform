resource "aws_instance" "local_pro" {
    ami = "ami-0081f0d5081b58505"
    instance_type = "t2.micro"

    provisioner "local-exec" {
        command = " echo ${self.public_ip} > file_test_local"
      
    }

  
}