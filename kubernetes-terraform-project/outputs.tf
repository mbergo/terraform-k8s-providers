# Outputs for the main configuration

output "vpc_id" {
  description = "ID of the created VPC"
  value       = module.networking.vpc_id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = module.networking.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs of the private subnets"
  value       = module.networking.private_subnet_ids
}

output "etcd_node_ips" {
  description = "Private IPs of the etcd nodes"
  value       = module.etcd.node_ips
}

output "kubernetes_node_ips" {
  description = "Private IPs of the Kubernetes nodes"
  value       = module.kubernetes.node_ips
}

output "load_balancer_dns" {
  description = "DNS name of the load balancer"
  value       = module.load_balancer.dns_name
}
