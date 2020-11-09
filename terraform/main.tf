provider "aws" {
  region = "us-west-2"
}

data "aws_ami" "ubuntu" {

    most_recent=true
    owners=["amazon"]
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id

  instance_type = "t3.micro"

  availability_zone = "us-west-2a"

  ebs_optimized=true

  monitoring=true
  
  key_name="keys_ec2"

  tags = {
    Name = "TF_EC2"
  }
}

data "aws_caller_identity" "current" {}


data "aws_region" "current"{}