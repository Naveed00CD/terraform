provider "aws" {
    region = "ap-south-1"
  
}





resource "aws_key_pair" "TESTk1" {
    key_name = "TEST"
  public_key = "C:/Users/PC/.ssh/new_ed_key.pub"

}

resource "aws_instance" "namek1" {
    ami = "ami-0081f0d5081b58505"
    instance_type = "t2.micro"
    key_name = aws_key_pair.TESTk1.key_name

    provisioner "remote-exec" {
        inline = ["sudo su-",
        "sudo apt update -y",
        "sudo apt install nginx -y",
        "sudo systemctl start nginx",
        "sudo systemctl enable nginx"

         ]
         connection {
           type = "ssh"
           user = "ec2-user"
           private_key = "C:/Users/PC/.ssh/new_ed_key"
           host = self.public_ip
         }
      
    }
  
}
