
## EC2 Security Group

resource "aws_security_group" "TF-web-sg" {
  name        = "Security Group for Web Server"
  description = "Allow HTTPS inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description      = "HTTPS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [var.vpc_cidr]
	}

	 ingress {
    description      = "HTTPS from VPC"
    from_port        = 9443
    to_port          = 9443
    protocol         = "tcp"
    cidr_blocks      = [var.vpc_cidr]
  }
  
  ingress {
    description      = "HTTPS from VPC"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = [var.vpc_cidr]
  }

  ingress {
    description      = "HTTP from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [var.vpc_cidr]
  }

	 ingress {
    description      = "HTTPS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.vpc_cidr]

 }
 ingress {
    description      = "HTTPS from VPC"
    from_port        = 888
    to_port          = 888
    protocol         = "tcp"
    cidr_blocks      = [var.vpc_cidr]

 }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Web-SG"
  }
#lifecycle { ignore_changes = [ tags,ingress] }
}

### ALB Security Group

resource "aws_security_group" "TF-alb-sg" {
  name        = "Security Group for ALB"
  description = "Allow alb inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description      = "HTTP from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "TF_alb-SG"
  }
}