resource "aws_vpc" "main" {
 cidr_block           = "10.0.0.0/16"
 enable_dns_support   = true
 enable_dns_hostnames = true
}
resource "aws_subnet" "public" {
 count                   = 2
 vpc_id                  = aws_vpc.main.id
 cidr_block              = var.public_subnets[count.index]
 map_public_ip_on_launch = true
 availability_zone       = element(var.azs, count.index)
}
resource "aws_subnet" "private" {
 vpc_id            = aws_vpc.main.id
 cidr_block        = var.private_subnet
 availability_zone = element(var.azs, 0)
}
resource "aws_internet_gateway" "igw" {
 vpc_id = aws_vpc.main.id
}
resource "aws_route_table" "public" {
 vpc_id = aws_vpc.main.id
 route {
   cidr_block = "0.0.0.0/0"
   gateway_id = aws_internet_gateway.igw.id
 }
}
resource "aws_route_table_association" "public" {
 count          = length(aws_subnet.public)
 subnet_id      = aws_subnet.public[count.index].id
 route_table_id = aws_route_table.public.id
}