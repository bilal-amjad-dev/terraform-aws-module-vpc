variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "vpc_cidr_block" {
  type = string
}

variable "public_subnet_cidr" {
  type = string
}

variable "availability_zone" {
  type    = string
  default = "ap-south-1a"
}
