# VPC + subnets
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  name = "zero-touch-eks-vpc"
  cidr = var.vpc_cidr_block

  azs             = ["us-east-2a", "us-east-2b"]
  public_subnets  = var.public_subnet
  private_subnets = var.private_subnet

  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    name = "zero-touch-eks-vpc"
  }
}

# EKS cluster 
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.0.0"

  cluster_name    = var.aws_cluster_name
  cluster_version = "1.29"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  enable_irsa = true

  # Node group
  eks_managed_node_groups = {
    default = {
      desired_size = 2
      max_size     = 3
      min_size     = 2

      instance_type = ["t3.medium"]

    }
  }
}
