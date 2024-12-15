resource "aws_route_table" "public_route_table" {

  depends_on = [
    aws_subnet.public_subnets
    ]

  vpc_id = aws_vpc.vpc.id

  tags = {
    managed_by = "terraform"
  }
}


resource "aws_route_table" "private_route_tables" {

  depends_on = [
    aws_subnet.private_subnets
  ]

  count = length(var.availability_zones)
  vpc_id = aws_vpc.vpc.id

  tags = {
    managed_by = "terraform"
  }
}


resource "aws_route" "public_rt_igw_route" {

  depends_on = [
    aws_route_table.public_route_table,
    aws_internet_gateway.env-igw

  ]

  route_table_id = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.env-igw.id
}


resource "aws_route" "private_rt_ngw_route" {

  depends_on = [
    aws_route_table.private_route_tables,
    aws_nat_gateway.nat
  ]

  count = length(var.availability_zones)
  route_table_id = aws_route_table.private_route_tables[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.nat[count.index].id
}


resource "aws_route_table_association" "public_rt_association" {

  depends_on = [
    aws_route_table.public_route_table
  ]

  count = length(var.availability_zones)
  subnet_id = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}


resource "aws_route_table_association" "private_rt_association" {

  depends_on = [
    aws_route_table.private_route_tables
  ]

  count = length(var.availability_zones)
  subnet_id = aws_subnet.private_subnets[count.index].id
  route_table_id = aws_route_table.private_route_tables[count.index].id
}