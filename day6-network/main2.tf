resource "aws_vpc" "main_2_vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name= "test2"

    }
  
}

resource "aws_internet_gateway" "igk" {
    vpc_id = aws_vpc.main_2_vpc.id

}

resource "aws_subnet" "pb_m2" {
    cidr_block = "10.0.0.0/18"
    vpc_id = aws_vpc.main_2_vpc.id
    availability_zone = "ap-south-1"


}

resource "aws_subnet" "primain2" {
    cidr_block = "10.0.0.0/20"
    vpc_id = aws_vpc.main_2_vpc.id
  
}

resource "aws_route_table" "rt" {
    vpc_id = aws_vpc.main_2_vpc.id
    route  {
        cidr_block ="0.0.0.0/0"
        gateway_id= aws_internet_gateway.igk.id
    }
  
}
resource "aws_route_table_association" "Name" {
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.rt.id
}

