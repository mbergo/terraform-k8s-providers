output "node_ips" {
  description = "Private IPs of the etcd nodes"
  value       = var.cloud_provider == "aws" ? aws_instance.etcd[*].private_ip : null
}
