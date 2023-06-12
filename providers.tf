terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.57.1"
    }
  }
  backend "s3" {
    bucket  = "static-private-test"
    key     = "tfstates/terraform.harips"
    encrypt = true
    region  = "ap-south-1"
    profile = "harips"
  }
}
provider "aws" {
  profile = "harips"
  region  = var.region
}
