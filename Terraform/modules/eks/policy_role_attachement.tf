resource "aws_iam_role_policy_attachment" "eks_policy_attachment_1" {
    depends_on = [
        aws_iam_role.eks_iam_role
    ]

    role = aws_iam_role.eks_iam_role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_iam_role_policy_attachment" "eks_policy_attachment_2" {
    depends_on = [
        aws_iam_role.eks_iam_role
    ]

    role = aws_iam_role.eks_iam_role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
}

resource "aws_iam_role_policy_attachment" "eks_policy_attachment_3" {
    depends_on = [
        aws_iam_role.eks_iam_role,
        aws_iam_policy.eks_cluster_policy
    ]

    role = aws_iam_role.eks_iam_role.name
    policy_arn = aws_iam_policy.eks_cluster_policy.arn
}

resource "aws_iam_role_policy_attachment" "nodegroup_policy_attachment_1" {
    depends_on = [
        aws_iam_role.eks_nodegroup_iam_role
    ]

    role = aws_iam_role.eks_nodegroup_iam_role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

resource "aws_iam_role_policy_attachment" "nodegroup_policy_attachment_2" {
    depends_on = [
        aws_iam_role.eks_nodegroup_iam_role
    ]

    role = aws_iam_role.eks_nodegroup_iam_role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

resource "aws_iam_role_policy_attachment" "nodegroup_policy_attachment_3" {
    depends_on = [
        aws_iam_role.eks_nodegroup_iam_role
    ]

    role = aws_iam_role.eks_nodegroup_iam_role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_role_policy_attachment" "nodegroup_policy_attachment_4" {
    depends_on = [
        aws_iam_role.eks_nodegroup_iam_role
    ]

    role = aws_iam_role.eks_nodegroup_iam_role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}
resource "aws_iam_role_policy_attachment" "nodegroup_policy_attachment_5" {
    depends_on = [
        aws_iam_role.eks_nodegroup_iam_role
    ]

    role = aws_iam_role.eks_nodegroup_iam_role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
}

resource "aws_iam_role_policy_attachment" "eks_ingress_policy_attachment" {
    depends_on = [
        aws_iam_role.eks_ingress_iam_role,
        aws_iam_policy.eks_ingress_policy
    ]

    role = aws_iam_role.eks_ingress_iam_role.name
    policy_arn = aws_iam_policy.eks_ingress_policy.arn
}

resource "aws_iam_role_policy_attachment" "logging_policy_attachment" {
    depends_on = [
        aws_iam_role.eks_logging_iam_role
    ]

    role = aws_iam_role.eks_logging_iam_role.name
    policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}

resource "aws_iam_role_policy_attachment" "cluster_autoscaler_policy_attachment" {
    depends_on = [
        aws_iam_role.eks_cluster_autoscaler_iam_role,
        aws_iam_policy.eks_cluster_autoscaler_policy
    ]

    role = aws_iam_role.eks_cluster_autoscaler_iam_role.name
    policy_arn = aws_iam_policy.eks_cluster_autoscaler_policy.arn
}