resource "aws_iam_policy" "eks_cluster_policy" {
  provider = aws.primary

    name = "java_eks_cluster_policy"
    path = "/"
    description = "EKS cluster policy"
    policy = var.eks_cluster_policy_file
    
    tags = {
        managed_by = "terraform"
    }
}

resource "aws_iam_policy" "eks_ingress_policy" {
  provider = aws.primary

    name = "java_eks_ingress_policy"
    path = "/"
    description = "IAM policy for the ALB ingress in EKS"
    policy = var.eks_ingress_policy_file

    tags = {
        managed_by = "terraform"
    }
}

resource "aws_iam_policy" "eks_cluster_autoscaler_policy" {
  provider = aws.primary

    name = "java_cluster_autoscaler_policy"
    path = "/"
    description = "IAM policy for the cluster autoscaler in EKS"
    policy = var.cluster_autoscaler_policy_file

    tags = {
        managed_by = "terraform"
    }
}