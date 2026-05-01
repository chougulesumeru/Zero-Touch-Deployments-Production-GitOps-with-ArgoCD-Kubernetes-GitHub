output "vpc_id" {
  description = "VPC id"
  value       = module.vpc.vpc_id
}

output "cluster_name" {
  description = "EKS cluster name"
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}
