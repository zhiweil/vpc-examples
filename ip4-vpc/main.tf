provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "ip4-vpc" {
  cidr_block = "10.0.0.0/16"
}