resource "aws_vpc" "main" {
    cidr_block = var.vpc_cidr_block

    tags = {
        name = "main"
    }
}

resource "aws_internet_gateway" "main-igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    name = "main-igw"
  }
}

#public subnet

data "aws_availability_zones" "available" {}

resource "aws_subnet" "public_subnets" {
  count = length(var.public_cidr_blocks)

  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_cidr_blocks[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "public_subnet_${count.index}"
  }
}

#private subnet

resource "aws_subnet" "private_subnets" {
  count = length(var.private_cidr_blocks)

  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_cidr_blocks[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "private_subnet_${count.index}"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main-igw.id
  }

  tags = {
    Name = "public_rt"
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "private_rt"
  }
}

resource "aws_route_table_association" "public_rt_association" {
  count = length(var.public_cidr_blocks)
  subnet_id = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public_rt.id
}