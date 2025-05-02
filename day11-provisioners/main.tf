provider "aws" {
    region = "ap-south-1"
  
}

resource "aws_instance" "nav" {
    ami = "ami-0dba43d6637e22dd8"
    instance_type = "t2.micro"
    
    provisioner "local-exec" {
        command = "the public_ip is ${self.public_ip}> file_ip.txt"
    }

    provisioner "remote-exec" {
        inline = [ touch "file100t", "echo test naveed the ip is  ${self.public.id} >> file100t"
         ]
      
    }
  
}

# #provisioners
# resource "aws_instance" "example" {
#   ami           = "ami-0261755bbcb8c4a84"
#   instance_type = "t2.micro"
#   tags = {
#     Name = "null resource"
#   }

#   provisioner "local-exec" {
#     command = "echo Instance public IP is ${self.private_ip} > instance_info.txt"
#   }
# }