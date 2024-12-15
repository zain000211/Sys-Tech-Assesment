resource "aws_db_subnet_group" "rds_subnet_group" {
    name = "java-subnet-group"
    description = "subnet group for rds sql"
    subnet_ids = var.private_subnet_ids
    tags = {
      managed_by = "terraform"
    }
  
}



resource "aws_db_parameter_group" "rds_parameter_group_postgress" {
    name =  "java-parameter-group-postgress"
    description = "parameter group for rds postgress"
    family = var.rds_parameter_group_family_postgress

    tags = {
      managed_by = "terraform"
    }
  
}


resource "aws_security_group" "rds_security_group_postgress" {
    name = "java-rds-security-group-postgress"
    description = "allow 5432 port "
    vpc_id = var.vpc_id

    ingress {
        from_port = var.rds_port_postgress
        to_port = var.rds_port_postgress
        protocol = "tcp"
        cidr_blocks = var.private_subnets_cidr
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        managed_by = "terraform"
    }
  
}


resource "aws_db_instance" "rds_postgress" {

    identifier = "java-postgress"
    engine = var.rds_engine_postgress
    instance_class = var.rds_db_instance_class_postgress
    username = var.rds_admin_username_postgress
    password = var.rds_admin_password_postgress
    backup_window = var.rds_backup_window
    maintenance_window = var.rds_maintenance_window
    port = var.rds_port_postgress
    publicly_accessible = false
    db_subnet_group_name = aws_db_subnet_group.rds_sql_subnet_group.name
    auto_minor_version_upgrade = false
    performance_insights_enabled = false
    allocated_storage = var.rds_allocated_storage_postgress
    skip_final_snapshot = true

    tags = {
        managed_by = "terraform"
    }
}