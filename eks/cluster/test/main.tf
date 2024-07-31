data "aws_caller_identity" "current" {}

module "cluster" {
  source = "../"

  env    = "dev"
  region = "us-east-1"

  cluster_name                         = "my-cluster"
  cluster_version                      = "1.30"
  cluster_endpoint_public_access       = true
  cluster_endpoint_public_access_cidrs = ["0.0.0.0/0"]

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  # Cluster access entry
  # To add the current caller identity as an administrator
  enable_cluster_creator_admin_permissions = true

  # One access entry with a policy associated
  access_entries = {
    example = {
      kubernetes_groups = []
      principal_arn     = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/MytecAdmin"

      policy_associations = {
        example = {
          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSViewPolicy"
          access_scope = {
            namespaces = ["default"]
            type       = "namespace"
          }
        }
      }
    }
  }

  eks_managed_node_groups = {
    # the name of the node group will be `dev-my-cluster-example`
    example = {
      # Starting on 1.30, AL2023 is the default AMI type for EKS managed node groups
      instance_types = ["t3.medium"]

      min_size = 2
      max_size = 5
      # This value is ignored after the initial creation
      # https://github.com/bryantbiggs/eks-desired-size-hack
      desired_size = 2

      # This is not required - demonstrates how to pass additional configuration to nodeadm
      # Ref https://awslabs.github.io/amazon-eks-ami/nodeadm/doc/api/
      cloudinit_pre_nodeadm = [
        {
          content_type = "application/node.eks.aws"
          content      = <<-EOT
            ---
            apiVersion: node.eks.aws/v1alpha1
            kind: NodeConfig
            spec:
              kubelet:
                config:
                  shutdownGracePeriod: 30s
                  featureGates:
                    DisableKubeletCloudCredentialProviders: true
          EOT
        }
      ]
    }
  }

  # A list of the desired control plane logs to enable. 
  # For more information, see Amazon EKS Control Plane Logging documentation 
  # (https://docs.aws.amazon.com/eks/latest/userguide/control-plane-logs.html
  cluster_enabled_log_types = ["api", "audit", "authenticator"]

  # For more information (https://docs.aws.amazon.com/eks/latest/userguide/eks-add-ons.html)
  cluster_addons = {
    eks-pod-identity-agent = {
      most_recent = true
    }
    coredns = {
      addon_version = "v1.11.1-eksbuild.8"
    }
    kube-proxy = {
      addon_version = "v1.30.0-eksbuild.3"
    }
    vpc-cni = {
      addon_version = "v1.18.2-eksbuild.1"
    }
  }

  tags = {
    ManagedBy   = "Terraform"
    Environment = "dev"
  }
}

module "vpc" {
  source = "../../../vpc/vpc"

  region = "us-east-1"
  env    = "dev"

  name       = "my-vpc"
  cidr_block = "10.0.0.0/16"

  availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets    = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets     = ["10.0.21.0/24", "10.0.22.0/24", "10.0.23.0/24"]
  database_subnets   = ["10.0.41.0/24", "10.0.42.0/24", "10.0.43.0/24"]

  enable_nat_gateway = true

  tags = {
    ManagedBy   = "Terraform"
    Environment = "dev"
  }
}
