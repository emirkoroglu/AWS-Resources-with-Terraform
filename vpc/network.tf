resource "aws_internet_gateway" "prod-igw" {
  vpc_id = aws_vpc.prod-vpc.id
  tags   = local.common_tags
}

resource "aws_route_table" "prod-public-crt" {
  vpc_id = aws_vpc.prod-vpc.id
  route {
    //associated subnet can reach everywhere
    cidr_block = "0.0.0.0/0"
    //CRT uses this IGW to reach internet
    gateway_id = aws_internet_gateway.prod-igw.id
  }
  tags = local.common_tags
}

resource "aws_route_table_association" "prod-crta-public-subnet-1" {
  subnet_id      = aws_subnet.prod-subnet-public-1.id
  route_table_id = aws_route_table.prod-public-crt.id
}

resource "aws_route_table_association" "prod-crta-public-subnet-2" {
  subnet_id      = aws_subnet.prod-subnet-public-2.id
  route_table_id = aws_route_table.prod-public-crt.id
}

resource "aws_route_table_association" "prod-crta-public-subnet-3" {
  subnet_id      = aws_subnet.prod-subnet-public-3.id
  route_table_id = aws_route_table.prod-public-crt.id
}

resource "aws_nat_gateway" "prod-ngw" {
  subnet_id = "${aws_subnet.prod-subnet-private-1.id} ${aws_subnet.prod-subnet-private-2.id} ${aws_subnet.prod-subnet-private-3.id}"

  tags = local.common_tags

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.prod-igw]
}