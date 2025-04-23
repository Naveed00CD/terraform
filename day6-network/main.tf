# VPC
resource "aws_vpc" "dev" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name= "devvpc"
    }
  
}
# IG and attch to vpc
resource "aws_internet_gateway" "name" {
    vpc_id = aws_vpc.dev.id
  
}
# Subnets 

resource "aws_subnet" "public" {
    cidr_block = "10.0.0.0/24"
    vpc_id = aws_vpc.dev.id
    availability_zone = "us-east-1a"
  
}
resource "aws_subnet" "pvt" {
    cidr_block = "10.0.1.0/24"
    vpc_id = aws_vpc.dev.id
    
  
}
# RT, # edit routes 
resource "aws_route_table" "name" {
    vpc_id = aws_vpc.dev.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.name.id
  }
}

# subnet associations
resource "aws_route_table_association" "name" {
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.name.id
  
}
# Create SG
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  vpc_id      = aws_vpc.dev.id
  tags = {
    Name = "dev_sg"
  }
 ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1" #all protocols 
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  }
resource "aws_key_pair" "name" {
    key_name = "public"
    public_key = file("~/.ssh/id_rsa.pub") #here you need to define public key file path

  
}


# Launch server
resource "aws_instance" "name" {
    ami = var.ami
    instance_type = var.instance_type
    subnet_id = aws_subnet.public.id
    associate_public_ip_address = true
    key_name               = aws_key_pair.name.key_name
    vpc_security_group_ids = [aws_security_group.allow_tls.id]

    
}

  
  


#Create pvt server and give secure internet to instance through nat gateway
#Create Pvt subnet
#Create PVT RT
#Editroutes nat to rt 
#PVT subnet association
#Create PVT server in PVT subnet 