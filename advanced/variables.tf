variable "aws_region" {
  description = "AWS Region for the advanced VPC lab."
  type        = string
  default     = "us-east-1"
}

variable "name_prefix" {
  description = "Prefix used in resource names and tags."
  type        = string
  default     = "terraform-vpc-advanced"
}

variable "vpc_cidr" {
  description = "IPv4 CIDR block for the VPC."
  type        = string
  default     = "10.30.0.0/16"

  validation {
    condition     = can(cidrnetmask(var.vpc_cidr))
    error_message = "Provide a valid IPv4 CIDR block."
  }
}

variable "availability_zone_count" {
  description = "Number of Availability Zones to use."
  type        = number
  default     = 2

  validation {
    condition = (
      var.availability_zone_count >= 2 &&
      var.availability_zone_count <= 3 &&
      floor(var.availability_zone_count) == var.availability_zone_count
    )
    error_message = "Choose 2 or 3 Availability Zones."
  }
}
