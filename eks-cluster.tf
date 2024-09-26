module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0" # Keep it updated to the latest stable version in the 19.x range

  # EKS Cluster Configuration
  cluster_name    = local.cluster_name
  cluster_version = "1.27" # This is the latest EKS version as of 2024

  # Networking
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  # Enable public access to the cluster endpoint
  cluster_endpoint_public_access = true

  # Default configurations for EKS-managed node groups
  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"
  }

  # Managed Node Groups
  eks_managed_node_groups = {
    one = {
      name = "node-group-1"

      instance_types = ["t3.small"]

      min_size     = 1
      max_size     = 3
      desired_size = 2
    }

    two = {
      name = "node-group-2"

      instance_types = ["t3.small"]

      min_size     = 1
      max_size     = 2
      desired_size = 1
    }
  }
}
