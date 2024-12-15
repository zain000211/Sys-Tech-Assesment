provider "aws" {
  region  = "us-east-1"  
  profile = "default"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "terraform-state-bucket" 
    key            = "terraform/state.tfstate"    
    region         = "us-east-1"                  
    dynamodb_table = "terraform-lock-table"       
    encrypt        = true                          
  }
}
