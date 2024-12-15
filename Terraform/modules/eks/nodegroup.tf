resource "aws_eks_node_group" "eks_nodegroup" {

    depends_on = [
        aws_eks_cluster.eks_cluster,
        aws_iam_role.eks_nodegroup_iam_role,
        aws_iam_role_policy_attachment.nodegroup_policy_attachment_1,
        aws_iam_role_policy_attachment.nodegroup_policy_attachment_2,
        aws_iam_role_policy_attachment.nodegroup_policy_attachment_3,
        aws_iam_role_policy_attachment.nodegroup_policy_attachment_4,
        aws_iam_role_policy_attachment.nodegroup_policy_attachment_5
    ]

    cluster_name = aws_eks_cluster.eks_cluster.name
    node_group_name = "java_node_group"
    node_role_arn = aws_iam_role.eks_nodegroup_iam_role.arn
    ami_type = var.nodegroup_ami_type
    capacity_type = var.nodegroup_capacity_type
    disk_size = var.nodegroup_disk_size
    instance_types = var.nodegroup_instance_type
    subnet_ids = var.public_subnet_ids
    
    scaling_config {
        desired_size = var.nodegroup_desired_size
        max_size = var.nodegroup_max_size
        min_size = var.nodegroup_min_size
    }

    update_config {
        max_unavailable = var.nodegroup_max_unavailable
    }

    tags = {
        managed_by = "terraform"

        "k8s.io/cluster-autoscaler/${aws_eks_cluster.eks_cluster.name}" = "owned"
        "k8s.io/cluster-autoscaler/enabled" = "true"
    }
}