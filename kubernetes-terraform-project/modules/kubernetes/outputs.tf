output "node_ips" {
  description = "Private IPs of the Kubernetes nodes"
  value       = var.cloud_provider == "aws" ? aws_instance.kubernetes[*].private_ip : null
}

output "node_ids" {
  description = "IDs of the Kubernetes nodes"
  value       = var.cloud_provider == "aws" ? aws_instance.kubernetes[*].id : null
}
