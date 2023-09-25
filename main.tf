provider "aws" {
 region = "ap-south-1"
}

resource "aws_instance" "kellydevops" {
  ami = "ami-0f5ee92e2d63afc18"
instance_type = "t2.micro"

tags = {
  Name = "instance"
}
}

resource "aws_key_pair" "deva" {
  key_name = "key"
  public_key = file("./key.pub")
}

resource "aws_vpc" "shiv" {
  cidr_block = "172.10.0.0/16"
  tags = {
    Name = "vpc"
  } 
}

resource "aws_subnet" "subnet1" {
  cidr_block = "172.10.1.0/24"
  vpc_id = aws_vpc.shiv.id
  tags = {
    Name = "subnet1"
  }
}

resource "aws_subnet" "subnet2" {
  cidr_block = "172.10.2.0/24"
  vpc_id = aws_vpc.shiv.id
  tags = {
    Name = "subnet2"
  }
}