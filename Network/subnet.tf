
resource "aws_subnet" "TF-public-subnet_a" {
  vpc_id     = aws_vpc.TF-prod-vpc.id
  cidr_block = var.public_subnet_a
  availability_zone = "ap-south-1a"
  tags = {
    Name = "TF-public-subnet-a"
    Owner = "var.owner"
  }
}
  resource "aws_subnet" "TF-public-subnet_b" {
  vpc_id     = aws_vpc.TF-prod-vpc.id
  cidr_block = var.public_subnet_b
  availability_zone = "ap-south-1b"
  tags = {
    Name = "TF-public-subnet-b"
    Owner = "var.owner"
  }
}
resource "aws_subnet" "TF-private-subnet_a" {
  vpc_id     = aws_vpc.TF-prod-vpc.id
  cidr_block = var.private_subnet_a
  availability_zone = "ap-south-1a"
  tags = {
    Name = "TF-private-subnet-a"
    Owner = "var.owner"
  }
}
resource "aws_subnet" "TF-private-subnet_b" {
  vpc_id     = aws_vpc.TF-prod-vpc.id
  cidr_block = var.private_subnet_b
  availability_zone = "${var.region}${var.zone_b}"
  tags = {
    Name = format("${var.project}_${var.env}_subnet_${var.zone_b}")
    Owner = "var.owner"
  }
}