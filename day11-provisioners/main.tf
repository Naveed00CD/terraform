# Define the AWS provider configuration.
provider "aws" {
  region = "ap-south-1"  # Replace with your desired AWS region.
}


resource "aws_key_pair" "example" {
  key_name   = "key01"  # Replace with your desired key name
  public_key = file("~/.ssh/id_ed25519.pub") 
  #public_key = file("C:/Users/PC/Downloads/key01.pem")


}
resource "aws_instance" "server" {
  ami                    = "ami-0081f0d5081b58505"
  instance_type          = "t2.micro"
  key_name      = aws_key_pair.example.key_name
  

  connection {
    type        = "ssh"
    user        = "ec2-user"  # Replace with the appropriate username for your EC2 instance
    #private_key = file("C:/Users/PC/Downloads/key01.pem")
    private_key = file("~/.ssh/id_ed25519")  #private key path
    host        = self.public_ip
  }
  # local execution procee 
 provisioner "local-exec" {
    command = "touch file85" #mysql -h -u user -p
   
 }
  # File provisioner to copy a file from local to the remote EC2 instance
  provisioner "file" {
    source      = "filek10"  # Replace with the path to your local file
    destination = "/home/ec2-user/file10"  # Replace with the path on the remote instance
  }
  # remote execution process 
  provisioner "remote-exec" {
    inline = [
"touch file200",
"echo hello from aws >> file200", ##mysql -h -u user -p
]
 }
}