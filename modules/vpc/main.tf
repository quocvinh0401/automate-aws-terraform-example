resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.this.id
  count                   = length(var.public_subnets)
  cidr_block              = var.public_subnets[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.vpc_name}-public-${count.index}"
  }
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.this.id
  count      = length(var.private_subnets)
  cidr_block = var.private_subnets[count.index]

  tags = {
    Name = "${var.vpc_name}-private-${count.index}"
  }

}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.vpc_name}-igw"
  }
}

resource "aws_route_table" "rt" {

  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.vpc_name}-rt"
  }
}

resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public" {
  count          = length(var.public_subnets)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.rt.id
}