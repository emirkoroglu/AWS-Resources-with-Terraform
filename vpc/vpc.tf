locals {
  common_tags = {
    Env  = "Dev"
    Team = "DevOps"
  }
}

resource "aws_vpc" "prod-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  instance_tenancy     = "default"
  tags                 = local.common_tags
}

resource "aws_subnet" "prod-subnet-public-1" {
  vpc_id                  = aws_vpc.prod-vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true" //it makes this a public subnet
  availability_zone       = "eu-west-1a"
  tags                    = local.common_tags
}

resource "aws_subnet" "prod-subnet-public-2" {
  vpc_id                  = aws_vpc.prod-vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true" //it makes this a public subnet
  availability_zone       = "eu-west-1b"
  tags                    = local.common_tags
}

resource "aws_subnet" "prod-subnet-public-3" {
  vpc_id                  = aws_vpc.prod-vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true" //it makes this a public subnet
  availability_zone       = "eu-west-1c"
  tags                    = local.common_tags
}

resource "aws_subnet" "prod-subnet-private-1" {
  vpc_id                  = aws_vpc.prod-vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "false" //it makes this a public subnet
  availability_zone       = "eu-west-1a"
  tags                    = local.common_tags
}

resource "aws_subnet" "prod-subnet-private-2" {
  vpc_id                  = aws_vpc.prod-vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "false" //it makes this a public subnet
  availability_zone       = "eu-west-1b"
  tags                    = local.common_tags
}

resource "aws_subnet" "prod-subnet-private-3" {
  vpc_id                  = aws_vpc.prod-vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "false" //it makes this a public subnet
  availability_zone       = "eu-west-1c"
  tags                    = local.common_tags
}
