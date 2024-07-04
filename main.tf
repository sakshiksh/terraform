
terraform {
  required_version = "~> 1.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.1"
    }
  }
}

provider "aws" {
  region = var.region_name
  // No need to specify access_key and secret_key when using environment variables
  // access_key = var.access_key
  // secret_key = var.secret_key
}

variable "region_name" {
  type    = string
  default = "us-east-1"
}

resource "aws_instance" "myec2" {
  ami           = "ami-06c68f701d8090592"
  instance_type = "t2.micro"
  tags = {
    Name = "terraform1"
  }
}
