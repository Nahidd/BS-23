resource "aws_eks_cluster" "cluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.cluster_role.arn
  ...
}

resource "aws_iam_role" "cluster_role" {
  name = "eks-cluster-role"
  ...

  # Attach necessary policies for EKS
  inline_policy {
    name   = "eks-cluster-policy"
    policy = data.aws_iam_policy_document.eks_cluster_policy.json
  }
}

data "aws_iam_policy_document" "eks_cluster_policy" {
  statement {
    actions = [
      "eks:DescribeCluster",
      "eks:ListClusters",
    ]

    resources = ["*"]
  }
}

# Other necessary resources for EKS cluster setup

resource "aws_eks_node_group" "node_group" {
  cluster_name    = aws_eks_cluster.cluster.name
  node_group_name = "eks-node-group"
  node_role_arn   = aws_iam_role.node_role.arn
  ...

  scaling_config {
    desired_size = 2
    max_size     = 10
    min_size     = 1
  }

  ...

  depends_on = [aws_eks_cluster.cluster]
}

resource "aws_iam_role" "node_role" {
  name = "eks-node-role"
  ...

  # Attach necessary policies for EKS node group
  inline_policy {
    name   = "eks-node-policy"
    policy = data.aws_iam_policy_document.eks_node_policy.json
  }
}

data "aws_iam_policy_document" "eks_node_policy" {
  statement {
    actions = [
      "ec2:DescribeInstances",
      "ec2:DescribeRegions",
      "ec2:DescribeSecurityGroups",
      "ec2:DescribeSubnets",
      "ec2:DescribeVolumes",
      "ec2:CreateSecurityGroup",
      "ec2:CreateTags",
      "ec2:CreateVolume",
      "ec2:ModifyInstanceAttribute",
      "ec2:AttachVolume",
      "ec2:AuthorizeSecurityGroupIngress",
      "ec2:DeleteTags",
      "ec2:DeleteVolume",
      "ec2:DetachVolume",
      "ec2:RevokeSecurityGroupIngress",
    ]

    resources = ["*"]
  }
}