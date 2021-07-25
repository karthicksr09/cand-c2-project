terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "Udacity_T2" {
  ami                    = "ami-0dc2d3e4c0f9ebd18"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-06297cfca142d08ed"]
  subnet_id              = "subnet-0783d43c6da8a89d9"
  count                  = 4

  tags = {
    Name = "Udacity_T2"
  }
}

resource "aws_instance" "Udacity_M4" {
  ami                    = "ami-0dc2d3e4c0f9ebd18"
  instance_type          = "m4.large"
  vpc_security_group_ids = ["sg-06297cfca142d08ed"]
  subnet_id              = "subnet-0783d43c6da8a89d9"
  count                  = 2

  tags = {
    Name = "Udacity_M4"
  }
}