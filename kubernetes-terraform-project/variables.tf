# Variables for the main configuration

variable "cloud_provider" {
  description = "The cloud provider to use (aws, gcp, or vmware)"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for the public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for the private subnets"
  type        = list(string)
}

variable "etcd_instance_type" {
  description = "Instance type for etcd nodes"
  type        = string
}

variable "kubernetes_instance_type" {
  description = "Instance type for Kubernetes nodes"
  type        = string
}