variable "cloud_provider" {
  description = "The cloud provider to use (aws, gcp, or vmware)"
  type        = string
}

variable "instance_count" {
  description = "Number of etcd instances to create"
  type        = number
}

variable "instance_type" {
  description = "Instance type for etcd nodes"
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
