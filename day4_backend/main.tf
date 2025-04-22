resource "aws_vpc" "vpck1" {
    cidr_block = "10.0.0.0/16"
    tags = {
      name ="vpck1"
    }
    

  
}

resource "aws_subnet" "sub" {

  cidr_block = "10.0.0.0/17"
  vpc_id=aws_vpc.vpck1.id
  tags = {
    name = "sub01"
  }

}
output "sub_ip" {
    value = aws_subnet.sub.id

  
}

output "vpc_id" {
    value = aws_vpc.vpck1
  
}