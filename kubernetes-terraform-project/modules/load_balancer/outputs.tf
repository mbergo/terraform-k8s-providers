output "dns_name" {
  description = "DNS name of the load balancer"
  value       = var.cloud_provider == "aws" ? aws_lb.kubernetes[0].dns_name : null
}
