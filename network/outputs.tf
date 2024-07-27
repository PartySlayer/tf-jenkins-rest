output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnets_id" {
  value = aws_subnet.public_subnets[*].id
}

output "public_subnet_cidr_block" {
  value = aws_subnet.public_subnets[*].cidr_block
}
