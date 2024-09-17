resource "aws_vpc" "main" {
  cidr_block = "10.124.0.0/16"

  tags = {
    Name = "main-vpc"
  }
}

data "aws_availability_zones" "azs" {
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.124.17.0/24"
  availability_zone = slice(data.aws_availability_zones.azs.names, 0, 3)

  tags = {
    Name = "Main"
  }
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.124.122.0/24"
  availability_zone = slice(data.aws_availability_zones.azs.names, 0, 3)

  tags = {
    Name = "Main"
  }
}
