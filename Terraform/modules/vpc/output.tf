output "vpc_id" {
    value = aws_vpc.vpc.id
    description = "VPC ID"
}
output "public_subnet_ids" {
    value = aws_subnet.public_subnets[*].id
}
output "private_subnet_ids" {
    value = aws_subnet.private_subnets[*].id
    description = "IDs for the private subnets in primary vpc"
}
output "cidr_block_id" {
    value = aws_vpc.vpc.cidr_block
    description = "cidr block of vpc"
  
}