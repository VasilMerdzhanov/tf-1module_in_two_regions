
terraform {
  required_providers {
    /*
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
    */

    aws = {
      source = "hashicorp/aws"
      version = "5.19.0"
    }
  }
}
/*
# Configure the GitHub Provider
provider "github" {
    token = "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"
}

resource "github_repository" "example" {
  name        = "tf-1module-in-2-regions"
  description = "My awesome codebase"

  visibility = "public"
}
*/


variable "region" {
  description = "The AWS region"
}

variable "ami" {
  description = "AMI to use"
}

resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = "t2.micro"
  tags = {
    Name = "example-instance-${var.region}"
  }
}