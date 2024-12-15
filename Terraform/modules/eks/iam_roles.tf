resource "aws_iam_role" "eks_iam_role" {

    name = "java_eks_iam_role"
    path = "/"
    assume_role_policy = var.eks_assume_role_policy_file

    tags = {
        managed_by = "terraform"
    }
}

resource "aws_iam_role" "eks_nodegroup_iam_role" {

    name = "java_nodegroup_iam_role"
    path = "/"
    assume_role_policy = var.eks_nodegroup_assume_role_policy_file

    tags = {
        managed_by = "terraform"
    }
}

resource "aws_iam_role" "eks_ingress_iam_role" {

    name = "java_ingress_iam_role"
    path = "/"
    assume_role_policy = jsonencode({
        Version: "2012-10-17",
        Statement: [
            {
                Effect: "Allow",
                Principal: {
                    "Federated": "arn:aws:iam::${var.account_id}:oidc-provider/oidc.eks.${var.region}.amazonaws.com/id/${var.eks_cluster_oidc}"
                },
                Action: "sts:AssumeRoleWithWebIdentity",
                Condition: {
                    StringEquals: {
                        "oidc.eks.${var.region}.amazonaws.com/id/${var.eks_cluster_oidc}:aud": "sts.amazonaws.com",
                        "oidc.eks.${var.region}.amazonaws.com/id/${var.eks_cluster_oidc}:sub": "system:serviceaccount:kube-system:aws-load-balancer-controller"
                    }
                }
            }
        ]
    })

    tags = {
      managed_by = "terraform"
    }
}

resource "aws_iam_role" "eks_logging_iam_role" {

    name = "java_logging_iam_role"
    path = "/"
    assume_role_policy = jsonencode({
        Version: "2012-10-17",
        Statement: [
            {
                Effect: "Allow",
                Principal: {
                    "Federated": "arn:aws:iam::${var.account_id}:oidc-provider/oidc.eks.${var.region}.amazonaws.com/id/${var.eks_cluster_oidc}"
                },
                Action: "sts:AssumeRoleWithWebIdentity",
                Condition: {
                    StringEquals: {
                        "oidc.eks.${var.region}.amazonaws.com/id/${var.eks_cluster_oidc}:sub": "system:serviceaccount:production:logging-sa",
                        "oidc.eks.${var.region}.amazonaws.com/id/${var.eks_cluster_oidc}:aud": "sts.amazonaws.com"
                    }
                }
            }
        ]
    })

    tags = {
        managed_by = "terraform"
    }
}

resource "aws_iam_role" "eks_cluster_autoscaler_iam_role" {

    name = "java_cluster_autoscaler_iam_role"
    path = "/"
    assume_role_policy = jsonencode({
        Version: "2012-10-17",
        Statement: [
            {
                Effect: "Allow",
                Principal: {
                    "Federated": "arn:aws:iam::${var.account_id}:oidc-provider/oidc.eks.${var.region}.amazonaws.com/id/${var.eks_cluster_oidc}"
                },
                Action: "sts:AssumeRoleWithWebIdentity",
                Condition: {
                    StringEquals: {
                        "oidc.eks.${var.region}.amazonaws.com/id/${var.eks_cluster_oidc}:sub": "system:serviceaccount:kube-system:cluster-autoscaler",
                        "oidc.eks.${var.region}.amazonaws.com/id/${var.eks_cluster_oidc}:aud": "sts.amazonaws.com"
                    }
                }
            }
        ]
    })

    tags = {
        managed_by = "terraform"
    }
}