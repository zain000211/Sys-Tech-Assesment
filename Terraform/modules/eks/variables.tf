variable "region" {}
variable "eks_cluster_oidc" {}
variable "stage" {}
variable "account_id" {}

variable "eks_version" {}
variable "public_subnet_ids" {}
variable "private_subnet_ids" {}
variable "eks_whitelisted_ips" {}

variable "nodegroup_ami_type" {}
variable "nodegroup_capacity_type" {}
variable "nodegroup_disk_size" {}
variable "nodegroup_instance_type" {}
variable "nodegroup_desired_size" {}
variable "nodegroup_max_size" {}
variable "nodegroup_min_size" {}
variable "nodegroup_max_unavailable" {}

variable "cluster_autoscaler_policy_file" {}
variable "eks_ingress_policy_file" {}
variable "eks_assume_role_policy_file" {}
variable "eks_cluster_policy_file" {}
variable "eks_nodegroup_assume_role_policy_file" {}