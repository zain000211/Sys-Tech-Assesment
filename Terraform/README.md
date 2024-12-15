# README: Using Terraform for AWS Infrastructure  

This README provides instructions on how to use Terraform to deploy and manage the AWS infrastructure using modular design principles. It ensures reusability, organization, and maintainability of the infrastructure as code.

---

## **Prerequisites**

1. **Tools Installed**:  
   - [Terraform](https://www.terraform.io/downloads.html) (v1.3 or later recommended)  
   - [AWS CLI](https://aws.amazon.com/cli/) (v2 recommended)  
   - Git  

2. **AWS Account Credentials**:  
   - Configure AWS CLI using:  
     ```bash
     aws configure
     ```
   - Ensure your IAM user/role has the necessary permissions for resource creation.

3. **Backend Configuration** (Optional):  
   - If you're using a remote backend (e.g., S3 for storing state files), ensure the backend bucket is created and configured.
    
4. **Initialize Terraform**
   - Run the following command to initialize Terraform and download the required providers and modules:   
     ```bash
     terraform init
     ```

6. **Plan the Infrastructure**:  
   - Generate and review the execution plan to see what resources will be created:
     ```bash
     terraform plan
     ```
7. **Apply the Infrastructure**:  
   - Apply the infrastructure changes to create resources:
     ```bash
     terraform apply
     ```
8. **Apply the Specific module**:  
   - Apply some specific modules to create resources:
     ```bash
     terraform plan -target=module.module_name.resource_block.name
     ```
   - Example
     ```bash
     terraform plan -target=module.vpc.aws_vpc.main
     terraform apply -target=module.vpc.aws_vpc.main
     ```
      
---

## **Project Structure**

The infrastructure uses a modular approach to organize Terraform code. The directory structure looks like this:

```plaintext
├── main.tf                # Entry point for Terraform
├── variables.tf           # Global variables
├── outputs.tf             # Outputs for the root module
├── terraform.tfvars       # Variable values for the environment
├── modules/
│   ├── vpc/               # Module for creating VPC
│   │   ├── vpc.tf
│   │   ├── routetables.tf
│   │   ├── variables.tf
│   │   ├── output.tf
│   ├── ecr/               # Module for ECR
│   │   ├── ecr.tf
│   │   ├── variables.tf
│   ├── rds/               # Module for RDS Instances
│   │   ├── rds.tf
│   │   ├── variables.tf
│   ├── eks/               # Module for EKS Cluster
│   |   ├── cluster.tf
|   |   ├── nodegroup.tf
|   |   ├── iam_policy.tf
|   |   ├── iam_roles.tf
|   |   ├── policy_role_attachement.tf
│   |   ├── variables.tf
│   ├── secretmanager/  # Module for Secret Manager
│       ├── secretmanager.tf
│       ├── variables.tf
