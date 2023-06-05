
resource "aws_route_table" "TF-prod-public-route_table" {
    vpc_id = "${aws_vpc.TF-prod-vpc.id}"
   # vpc_id = var.vpc_id
    route {
        //associated subnet can reach everywhere
        cidr_block = "0.0.0.0/0" 
        //CRT uses this IGW to reach internet
        gateway_id = "${aws_internet_gateway.TF-prod-igw.id}" 
  }
  tags = {
     Name = "TF-prod-public-route_table"
  }
}
resource "aws_route_table" "TF-prod-private-route_table" {
    vpc_id = "${aws_vpc.TF-prod-vpc.id}"
    
  tags = {
     Name = "TF-prod-private-route_table"
  }
}

resource "aws_route_table_association" "prod-public-route_public-subnet_a"{
    subnet_id = "${aws_subnet.TF-public-subnet_a.id}"
    route_table_id = "${aws_route_table.TF-prod-public-route_table.id}"
}
resource "aws_route_table_association" "prod-public-route_public-subnet-b"{
    subnet_id = "${aws_subnet.TF-public-subnet_b.id}"
    route_table_id = "${aws_route_table.TF-prod-public-route_table.id}"
}
resource "aws_route_table_association" "prod-public-route_private-subnet-a"{
    subnet_id = "${aws_subnet.TF-private-subnet_a.id}"
    route_table_id = "${aws_route_table.TF-prod-public-route_table.id}"
}
resource "aws_route_table_association" "prod-public-route_private-subnet-b"{
    subnet_id = "${aws_subnet.TF-private-subnet_b.id}"
    route_table_id = "${aws_route_table.TF-prod-public-route_table.id}"
}