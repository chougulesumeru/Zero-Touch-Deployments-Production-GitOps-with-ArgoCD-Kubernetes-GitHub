variable "aws_region" {
  description = "AWS region where all resources are deployed"
  default     = "us-east-2"
  type        = string
}

variable "aws_cluster_name" {
  description = "eks cluster name"
  default     = "zero-touch-eks"
  type        = string
}

variable "vpc_cidr_block" {
  description = "CIDR block of VPC"
  default     = "10.0.0.0/16"
  type        = string
}

variable "public_subnet" {
  description = "public subnet for VPC"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
  type        = list(string)
}

variable "private_subnet" {
  description = "private subnet of VPC"
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
  type        = list(string)
}
