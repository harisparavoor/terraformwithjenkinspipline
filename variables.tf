variable "region" {
  type = string
  default = "ap-south-1"
}

variable "project" {
  type = string
  default = "My_Test_TF"
}

variable "env" {
  type = string
  default = "Dev"
}
variable "owner" {
  type = string
  default = "IT-Team"
}

variable "zone_a"{
  type = string
  default = "a"
}
variable "zone_b"{
  type = string
  default = "b"
}
variable "vpc_cidr" {
  type = string
  default = "10.1.0.0/16"
}

variable "public_subnet_a" {
  type = string
  default = "10.1.1.0/24"
}

variable "public_subnet_b" {
  type = string
  default = "10.1.2.0/24"
}

variable "private_subnet_a" {
  type = string
  default = "10.1.3.0/24"
}
variable "private_subnet_b" {
  type = string
  default = "10.1.4.0/24"
}
variable "windows_ami" {
  type = string
  default = "ami-04893cdb768d0f9ee"
}

variable "amazon_linux_ami" {
  type = string
  default = "ami-0f8ca728008ff5af4"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}
variable "public_key" {
  type = string
  default = "hari_owndev"
}
variable "instance_iam_profile" {
  type    = string
  default = "EC2RoleForSSM"
}
variable "public_ip"{
  type    = string
  default = "TF-eip"
}
variable "alb_name"{
  type    = string
  default = "TF-alb"
}