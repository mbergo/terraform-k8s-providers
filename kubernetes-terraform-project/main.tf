# Main Terraform configuration file

module "networking" {
  source = "./modules/networking"
  
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  cloud_provider      = var.cloud_provider
}

module "etcd" {
  source = "./modules/etcd"
  
  instance_count = 3
  instance_type  = var.etcd_instance_type
  subnet_ids     = module.networking.private_subnet_ids
  vpc_id         = module.networking.vpc_id
  cloud_provider = var.cloud_provider
}

module "kubernetes" {
  source = "./modules/kubernetes"
  
  instance_count = 4
  instance_type  = var.kubernetes_instance_type
  subnet_ids     = module.networking.private_subnet_ids
  vpc_id         = module.networking.vpc_id
  cloud_provider = var.cloud_provider
}

module "load_balancer" {
  source = "./modules/load_balancer"
  
  vpc_id            = module.networking.vpc_id
  public_subnet_ids = module.networking.public_subnet_ids
  kube_node_ids     = module.kubernetes.node_ids
  cloud_provider    = var.cloud_provider
}

module "monitoring" {
  source = "./modules/monitoring"
  
  depends_on = [module.kubernetes]
}
