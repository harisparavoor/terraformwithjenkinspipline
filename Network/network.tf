resource "aws_vpc" "TF-prod-vpc" {
  cidr_block       = var.vpc_cidr
  #enable_dns_support = “true” #gives you an internal domain name
  #enable_dns_hostnames = “true” #gives you an internal host name
  #enable_classiclink = “false”
  instance_tenancy = "default"

  tags = { 
   Name = format("${var.project}_${var.env}_vpc_${var.region}")
  }
}
resource "aws_internet_gateway" "TF-prod-igw" {
  vpc_id = "${aws_vpc.TF-prod-vpc.id}"
  tags = {
     Name = format("${var.project}_${var.env}_igw_${var.region}")
  }
}