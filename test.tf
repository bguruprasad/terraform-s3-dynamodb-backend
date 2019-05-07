provider "aws" {
  region     = "eu-west-1"
}

terraform {
  backend "s3" {
    bucket = "terraformbackend-guru"
    key = "terraform"
    region = "eu-west-1"
    dynamodb_table = "terraform-lock"
  }
}

variable "instance_type" {
 default = "t2.micro"
}

resource "aws_instance" "ec2_instance" {
 ami = "ami-07683a44e80cd32c5"
 instance_type = "${var.instance_type}"
}

output "ip" {
 value = "${aws_instance.ec2_instance.public_ip}"
}
