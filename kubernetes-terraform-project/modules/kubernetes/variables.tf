variable "cloud_provider" {
  description = "The cloud provider to use (aws, gcp, or vmware)"
  type        = string
}

variable "instance_count" {
  description = "Number of Kubernetes instances to create"
  type        = number
}

variable "instance_type" {
  description = "Instance type for Kubernetes nodes"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs to place the instances in"
  type        = list(string)
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "ssh_private_key_path" {
  description = "Path to the SSH private key for instance access"
  type        = string
}
