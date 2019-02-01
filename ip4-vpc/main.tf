provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "ip4-vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  instance_tenancy = "default"

  # we don't want to use ip6 for this VPC
  assign_generated_ipv6_cidr_block = false

  tags = {
    Name = "ip4-vpc"
  }

  # set these to true for account that supports EC2 classic
  # false is the default value
  # enable_classiclink = true
  # enable_classiclink_dns_support = true
}

resource "aws_internet_gateway" "ip4-vpc-ig" {
  vpc_id = "${aws_vpc.ip4-vpc.id}"
}

