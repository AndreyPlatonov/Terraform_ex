provider "aws" {
  region = "us-west-2"
}

data "aws_ami" "latest_ubuntu" {
         most_recent = true
         owners      = ["amazon"]

  filter {
      name = "name"
      values = ["*Ubuntu*"]
  }

  filter {
      name = "owner-alias"
      values = ["amazon"]
  }
}


resource "aws_instance" "web" {
  ami           = data.aws_ami.latest_ubuntu.id

  instance_type = "t3.micro"

  availability_zone = "us-west-2a"

  ebs_optimized=true

  monitoring=true
  


  tags = {
    Name = "TF_EC2"
  }
}

data "aws_caller_identity" "current" {}


data "aws_region" "current"{}