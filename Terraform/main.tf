module "vpc" {
  source = "./modules/vpc"
  public_eip = var.public_eip
  cidr_block = var.cidr_block
  availability_zones = var.availability_zones
  public_subnets_cidr = var.public_subnets_cidr
  private_subnets_cidr = var.private_subnets_cidr
}

module "eks" {
  source = "./modules/eks"
  depends_on = [
    module.vpc
  ]

  account_id = var.account_id
  region = var.region
  eks_cluster_policy_file = data.local_file.eks_cluster_policy_file.content
  eks_ingress_policy_file = data.local_file.eks_ingress_policy_file.content
  cluster_autoscaler_policy_file = data.local_file.cluster_autoscaler_policy_file.content
  eks_assume_role_policy_file = data.local_file.eks_assume_role_policy_file.content
  eks_nodegroup_assume_role_policy_file = data.local_file.eks_nodegroup_assume_role_policy_file.content
  eks_cluster_oidc = var.eks_cluster_oidc
  eks_version = var.eks_version
  eks_whitelisted_ips = var.eks_whitelisted_ips
  nodegroup_ami_type = var.nodegroup_ami_type
  nodegroup_capacity_type = var.nodegroup_capacity_type
  nodegroup_desired_size = var.nodegroup_desired_size
  nodegroup_disk_size = var.nodegroup_disk_size
  nodegroup_instance_type = var.nodegroup_instance_type
  nodegroup_max_size = var.nodegroup_max_size
  nodegroup_min_size = var.nodegroup_min_size
  nodegroup_max_unavailable = var.nodegroup_max_unavailable
  public_subnet_ids = module.network.public_subnet_ids
  private_subnet_ids = module.network.private_subnet_ids
  //pods_ipv4_cidr = var.pods_ipv4_cidr

}


module "ecr" {
  source = "./modules/ecr"
  repository_names  = var.repository_names
}

module "rds" {
  source            = "./modules/rds"
  primary_rds_name  = var.primary_rds_name
  secondry_rds_name = var.secondry_rds_name
  instance_class    = var.instance_class
  storage           = var.storage
  db_name           = var.db_name
  backup_retention_period = var.backup_retention_period
  secret_manager_arn      = var.secret_manager_arn
}

module "secretmanager" {
  source = "./modules/secretmanager"
  secret_name = var.secret_name
  description_secretmanageer = var.description_secretmanageer 
  secret_value = var.secret_value
  secret_type = var.secret_type
  secret_key = var.secret_key
  plain_text_secret = var.plain_text_secret
}