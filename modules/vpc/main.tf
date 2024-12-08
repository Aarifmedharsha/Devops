resource "aws_vpc" "main" {
 cidr_block = var.cidr_block
}
resource "aws_subnet" "public" {
 count = 2
 vpc_id                  = aws_vpc.main.id
 cidr_block              = cidrsubnet(aws_vpc.main.cidr_block, 4, count.index)
 map_public_ip_on_launch = true
 availability_zone       = var.availability_zones[count.index]
}
resource "aws_subnet" "private" {
 count = 2
 vpc_id                  = aws_vpc.main.id
 cidr_block              = cidrsubnet(aws_vpc.main.cidr_block, 4, 2 + count.index)
 availability_zone       = var.availability_zones[count.index]
}
