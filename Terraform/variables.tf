variable "region" {
  description = "Primary AWS region"
  type        = string
}

############################### VPC ##########################

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

############################### ECR ##########################

variable "repository_names" {
  description = "List of repository names to create in ECR"
  type        = string
  default     = "java-app"
}


############################### Network Variables ##########################


variable "availability_zones" {
    type = list(string)
    description = "Availability zones for VPC"
    default = [ "us-east-1a", "us-east-1b", "us-east-1c" ]
}

variable "public_subnets_cidr" {
    type = list(string)
    description = "Public Subnet CIDR values "
    default = [ "172.x.x.x/24", "172.x.x.x/24", "172.x.x.x/24" ]
}

variable "private_subnets_cidr" {
    type = list(string)
    description = "Private Subnet CIDR values"
    default = [ "172.x.x.x/24", "172.x.x.x/24", "172.x.x.x/24" ]
}


################################# EKS Variables ###########################

variable "eks_cluster_oidc" {
  type = string
  description = "EKS cluster OIDC provider"
}

variable "eks_version" {
  type = string
  description = "Control plane version for the kubernetes cluster"
  default = "1.24"
}

variable "eks_whitelisted_ips" {
  type = list(string)
  description = "List of IP addresses which can access Kubernetes cluster publicly"
  default = [
      "1.2.3.4/32",
      "1.2.6.7/32"
  ]
}


variable "nodegroup_ami_type" {
  type = string
  description = "AMI type of the instances for primary node group"
  default = "AL2_x86_64"
}

variable "nodegroup_capacity_type" {
  type = string
  description = "Instance capacity type for primary node group"
  default = "ON_DEMAND"
}

variable "nodegroup_disk_size" {
  type = string
  description = "Disk size attached to the primary instances"
  default = "50"
}

variable "nodegroup_instance_type" {
  type = list(string)
  description = "Instance types for the primary node group"
  default = [ "t3.small" ]
}

variable "nodegroup_desired_size" {
  type = number
  description = "desired size of the primary node group"
  default = 1
}

variable "nodegroup_max_size" {
  type = number
  description = "maximum number of instances in primary node group"
  default = 3
}

variable "nodegroup_min_size" {
  type = number
  description = "minimum number of instance in primary node group"
  default = 1
}

variable "nodegroup_max_unavailable" {
  type = number
  description = "maximum number of unavailable instance in the node group"
  default = 1
}

################################## Secret Manager Module ###########################


variable "secret_type" {
  type        = string
  description = "Type of secret to be stored: either key_value_pair or plain_text"
  
}

#incase you want to set the dafault value as plain_text use secret_type as plain_text use this: terraform apply -var 'secret_type=plain_text'

variable "plain_text_secret" {
  type = string
  description = "Plain text secret to be stored"
  default = "secret plain text"
}

variable "description_secretmanageer" {
  type = string
  description = "enter description"
  default = "secret created through terraform"
  
}

variable "secret_name" {
  type = string
  description = "enter name of your secret"
  default = "terrafrom"
  
}
variable "secret_key" {
  type        = string
  description = "Key of the secret"
  default     = "secret_key"
}

variable "secret_value" {
  type        = string
  description = "Value of the secret"
  default     = "secret_value"
}

################################## RDS Module ###########################



variable "rds_port_postgress" {
    type = number
    description = "rds db port"
    default = 5432
  
}

variable "rds_engine_postgress" {
    type = string
    description = "RDS engine Type"
    default = "postgres"
}


variable "rds_engine_version_postgress" {
    type = string
    description = "engine version"
    default = "13"
}


variable "rds_db_instance_class_postgress" {
  type = string
  description = "Instance type of RDS"
  default = "db.t3.large"
}


variable "rds_admin_username_postgress" {
    type = string
    description = "enter db username for postgress"
  
}

variable "rds_admin_password_postgress" {
    type = string
    description = "enter db password for postgress"
}


variable "rds_parameter_group_family_postgress" {
    type = string
    description = "Parameter Group Name"
    default = "postgres14"  
}

variable "rds_maintenance_window" {
    type = string
    description = "rds maintenance window"
    default = "sun:12:00-sun:14:00"
  
}

variable "rds_backup_window" {
   type = string
   description = "rds backup window"
   default = "09:00-11:00"
}  


variable "rds_allocated_storage_postgress" {
    type = number
    description = "allocated storage of rds"
    default = "20"
  
}
