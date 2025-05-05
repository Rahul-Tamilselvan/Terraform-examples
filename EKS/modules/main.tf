# IAM role for EKS cluster control plane
resource "aws_iam_role" "eks_cluster" {
  name = "${var.environment}-eks-cluster-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect    = "Allow",
      Principal = { Service = "eks.amazonaws.com" },
      Action    = "sts:AssumeRole"
    }]
  })
}

# Attach EKS cluster policy to the role
resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
  role       = aws_iam_role.eks_cluster.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

# IAM role for EKS worker nodes
resource "aws_iam_role" "eks_nodes" {
  name = "${var.environment}-eks-node-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect    = "Allow",
      Principal = { Service = "ec2.amazonaws.com" },
      Action    = "sts:AssumeRole"
    }]
  })
}

# Attach multiple AWS-managed policies for worker nodes
resource "aws_iam_role_policy_attachment" "eks_nodes_policies" {
  for_each = toset([
    "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly",
    "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  ])
  role       = aws_iam_role.eks_nodes.name
  policy_arn = each.value
}

# EKS control plane
resource "aws_eks_cluster" "this" {
  name     = "${var.environment}-eks-cluster"
  role_arn = aws_iam_role.eks_cluster.arn

  # Specify subnets for networking
  vpc_config {
    subnet_ids = var.subnet_ids
  }

  # Wait until IAM role is attached before creating the cluster
  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_policy
  ]
}

# Worker node group configuration
resource "aws_eks_node_group" "default" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = "${var.environment}-eks-nodes"
  node_role_arn   = aws_iam_role.eks_nodes.arn
  subnet_ids      = var.subnet_ids

  # Fixed size node group: 4 nodes
  scaling_config {
    desired_size = var.desired_capacity
    min_size     = var.desired_capacity
    max_size     = var.desired_capacity
  }

  instance_types = ["t3.medium"]

  depends_on = [aws_eks_cluster.this]
}
