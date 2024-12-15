# Sys-tech-assesment

> **Summary**
This repository contains 
   - Sample Java Application
   - Helm Chart
   - Terraform Scrips


**Java Application**:  
   Thers is a sample java application in Java-App folder. Its Dockerfile is also present in that folder  
   

**Terraform**
   Terraform scripts are present in Terraform folder. These scripts will be use to create infrastructure of on AWS for java application that will run on EKS and use RDS 
   
**Helm Chart**
   This folder contains helm chart which is use to deploy java application on EKS cluster

**CI/CD**
   CI/CD pipeline created for java application. Pipeline.yml file in located in .github/workflow folder this pipeline build the code run some test and deploy application on EKS through Helm chart.