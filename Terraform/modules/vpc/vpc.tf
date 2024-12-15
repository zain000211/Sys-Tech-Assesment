resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
  enable_dns_hostnames = "true"

  tags = {
    managed_by = "terraform"
  }
}


resource "aws_subnet" "public" {
  depends_on = [
    aws_vpc.vpc
  ]
  count                   = length(var.public_subnets_cidr)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = element(var.public_subnets_cidr, count.index)
  map_public_ip_on_launch = true
  availability_zone       = element(var.availability_zones, count.index)

  tags = {
    managed_by = "terraform"
    "kubernetes.io/role/elb" = 1
  }
}

resource "aws_subnet" "private" {
  depends_on = [
    aws_vpc.vpc
  ]

  count             = length(var.private_subnets_cidr)
  vpc_id            = aws_vpc.main.id
  cidr_block        = element(var.private_subnets_cidr, count.index)
  availability_zone = element(var.availability_zones, count.index)

  tags = {
    managed_by = "terraform"
    "kubernetes.io/role/elb" = 1
  }
}


resource "aws_internet_gateway" "app_igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    managed_by = "terraform"
  }
}


resource "aws_eip" "nat_eip" {
  count      = var.public_eip ? 1 : 0
  vpc        = true
  depends_on = [aws_internet_gateway.app_igw]

  tags = {
    managed_by = "terraform"
  }
}


resource "aws_nat_gateway" "nat" {
  connectivity_type = "private"
  count             = length(var.availability_zones)
  subnet_id         = aws_subnet.public_subnets[count.index].id

  tags = {
    managed_by = "terraform"
  }

}

