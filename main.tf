terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "lab" {
  cidr_block           = "10.20.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name        = "terraform-vpc-lab"
    Environment = "learning"
    ManagedBy   = "Terraform"
  }
}

output "vpc_id" {
  description = "ID of the newly created VPC."
  value       = aws_vpc.lab.id
}

output "vpc_cidr_block" {
  description = "IPv4 range assigned to the VPC."
  value       = aws_vpc.lab.cidr_block
}

output "vpc_arn" {
  description = "Amazon Resource Name of the VPC."
  value       = aws_vpc.lab.arn
}
