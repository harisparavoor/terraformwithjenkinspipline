variable "vpc_cidr" {}
variable "public_subnet" {}
variable "private_subnet" {}
variable "windows_ami" {}
variable "amazon_linux_ami" {}
variable "instance_type" {}
variable "public_key" {}
variable "instance_iam_profile"{}
variable "public_ip"{}
#variable "instance_web2_id"{
 #   type = string
#}
variable "vpc_id" {}
variable "private_subnet_a_id" {
    type = string
}

variable "public_subnet_a_id" {
    type = string
}
variable "public_subnet_b_id" {
    type = string
}
variable "private_subnet_b_id" {
    type = string
}
variable "alb_name" {
    type = string
}

variable "project" {
    type = string
}
variable "env" {
    type = string
}

variable "zone_a" {
    type = string
}
variable "zone_b" {
    type = string
}

variable "region" {
     type = string
}
variable "owner" {}