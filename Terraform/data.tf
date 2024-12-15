data "local_file" "cluster_autoscaler_policy_file" {
    filename = "${path.module}/data/eks/cluster_autoscaler_policy.json"
}

data "local_file" "eks_ingress_policy_file" {
    filename = "${path.module}/data/eks/eks_ingress_policy.json"
}


data "local_file" "eks_assume_role_policy_file" {
    filename = "${path.module}/data/eks/eks_assume_role_policy.json"
}

data "local_file" "eks_cluster_policy_file" {
    filename = "${path.module}/data/eks/eks_cluster_policy.json"
}


data "local_file" "eks_nodegroup_assume_role_policy_file" {
    filename = "${path.module}/data/eks/eks_nodegroup_assume_role_policy.json"
}