output "vpc_id" {
  description = "ID of the created VPC"
  value       = var.cloud_provider == "aws" ? aws_vpc.main[0].id : null
}

output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = var.cloud_provider == "aws" ? aws_subnet.public[*].id : null
}

output "private_subnet_ids" {
  description = "IDs of the private subnets"
  value       = var.cloud_provider == "aws" ? aws_subnet.private[*].id : null
}
