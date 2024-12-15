# Sys-tech-assesment

## Summary
This repository contains 
   - Sample Java Application
   - Helm Chart
   - Terraform Scrips
   - Helm-deploy.sh


**Java Application**:  
   Thers is a sample java application in Java-App folder. Its Dockerfile is also present in that folder  
   

**Terraform**
   Terraform scripts are present in Terraform folder. These scripts will be use to create infrastructure of on AWS for java application that will run on EKS and use RDS 
   
**Helm Chart**
   This folder contains helm chart which is use to deploy java application on EKS cluster

**Helm-deploy.sh**
   This sbash script is used to deploy helm chart of java application on EKS cluster

## CI/CD
   This pipeline automates the process of:
   1. Building a Java application using Maven.
   2. Running unit tests to ensure code quality.
   3. Building and pushing a Docker image to Amazon Elastic Container Registry (ECR).
   4. Deploying the application to an Amazon Elastic Kubernetes Service (EKS) cluster using Helm.

**GitHub Secrets**
   To securely configure AWS credentials, set the following secrets in GitHub repository:

   
   AWS access key
   ```bash
   AWS_ACCESS_KEY_ID
   ```
   AWS secret access key
   ```bash
   AWS_SECRET_ACCESS_KEY
   ```
**Pipeline Setup**
1. Add the provided GitHub Actions YAML file to repository under ```.github/workflows/ci-cd.yaml ```

2. Ensure the following directory structure:
    ```bash
    /java-app
    /helm-chart
    /Terraform
    .github/workflows/ci-cd.yaml
    ```
3. Use GitHub Secrets
  - Go to GitHub repository
  - Navigate to Settings > Secrets and variables > Actions
  - Click on New repository secret.
  - Add the following secrets:
    AWS access key
    ```bash
    AWS_ACCESS_KEY_ID

    ```
    AWS secret access key
    ```bash
    AWS_SECRET_ACCESS_KEY

4. Restrict Permissions
   Ensure the IAM user associated with credentials has the following permissions:
   - AmazonEC2ContainerRegistryFullAccess
   - AmazonEKSClusterPolicy

5. Execution Steps
   Push your code changes to the ```main``` branch to trigger the pipeline.

6. Verify Deployment:
   Run the following command locally to verify deployment
   
   ```kubectl get pods -n java-app ```