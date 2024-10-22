variable "cloud_provider" {
  description = "The cloud provider to use (aws, gcp, or vmware)"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "kube_node_ids" {
  description = "List of Kubernetes node IDs"
  type        = list(string)
}

variable "ssl_certificate_arn" {
  description = "ARN of the SSL certificate for HTTPS"
  type        = string
}
