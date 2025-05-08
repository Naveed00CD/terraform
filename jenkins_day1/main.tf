resource "aws_instance" "jenkins" {
    ami = "ami-0ad4ab6133676da9a"
    instance_type = "t2.medium"
  
}
# sudo yum update -y

# #---------------git install ---------------

# sudo yum install git -y


# #-------java dependency for jenkins------------

# sudo yum install java-17-amazon-corretto.x86_64


# #------------jenkins install-------------
# sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
# sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
# sudo yum install jenkins -y
# sudo systemctl enable jenkins
# sudo systemctl start jenkins
