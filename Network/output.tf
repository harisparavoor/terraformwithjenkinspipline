output "vpc_id" {
  value      = aws_vpc.TF-prod-vpc.id
}

output "TF-private_subnet_a_id" {
  value = aws_subnet.TF-private-subnet_a.id
}
output "TF-private_subnet_b_id" {
  value = aws_subnet.TF-private-subnet_b.id
}
output "TF-public_subnet_a_id" {
  value = aws_subnet.TF-public-subnet_a.id
}
output "TF-public_subnet_b_id" {
  value = aws_subnet.TF-public-subnet_b.id
}
output "TF_internet_gateway_id" {
  value = aws_internet_gateway.TF-prod-igw.id
}
output "public_route_table" {
  value = aws_route_table.TF-prod-public-route_table.id
  }
  output "private_route_table" {
  value = aws_route_table.TF-prod-private-route_table.id
  }