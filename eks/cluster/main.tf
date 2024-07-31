provider "aws" {
  region = var.region
}

locals {
  cluster_name = "${var.env}-${var.cluster_name}"
  tags = merge(var.tags, {
    Environment = var.env
    ManagedBy   = "Terraform"
  })

  # add prefix dev and cluster name to the node group
  eks_managed_node_groups = {
    for key, value in var.eks_managed_node_groups : "${var.env}-${var.cluster_name}-${key}" => value
  }
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  # Cluster
  cluster_name                            = local.cluster_name
  cluster_version                         = var.cluster_version
  cluster_endpoint_private_access         = var.cluster_endpoint_private_access
  cluster_endpoint_public_access          = var.cluster_endpoint_public_access
  cluster_endpoint_public_access_cidrs    = var.cluster_endpoint_public_access_cidrs
  cluster_security_group_additional_rules = local.cluster_security_group_additional_rules
  cluster_timeouts                        = var.cluster_timeouts
  cluster_addons                          = var.cluster_addons
  cluster_addons_timeouts                 = var.cluster_addons_timeouts
  cluster_tags                            = var.cluster_tags

  # VPC
  vpc_id     = var.vpc_id
  subnet_ids = var.subnet_ids

  # Access Entry
  enable_cluster_creator_admin_permissions = var.enable_cluster_creator_admin_permissions
  access_entries                           = var.access_entries

  # Node Group
  node_security_group_additional_rules         = var.node_security_group_additional_rules
  node_security_group_enable_recommended_rules = var.node_security_group_enable_recommended_rules
  node_security_group_tags                     = var.node_security_group_tags

  # EKS Managed Node Group
  eks_managed_node_groups         = local.eks_managed_node_groups
  eks_managed_node_group_defaults = var.eks_managed_node_group_defaults

  # Tags
  tags = local.tags
}

# Get Managed Prefix List of VPC Lattice and add it to the cluster security group
locals {
  # add vpc lattice prefix to the cluster security group
  cluster_security_group_additional_rules = var.enable_vpc_lattice ? merge(var.cluster_security_group_additional_rules, {
    vpc_lattice = {
      description = "Allow traffic from VPC Lattice"
      type        = "ingress"
      from_port   = 0
      to_port     = 65535
      protocol    = "tcp"
      prefix_list_ids = [
        data.aws_ec2_managed_prefix_list.lattice[0].id,
        data.aws_ec2_managed_prefix_list.lattice_ipv6[0].id
      ]
    }
  }) : var.cluster_security_group_additional_rules
}

data "aws_ec2_managed_prefix_list" "lattice" {
  count = var.enable_vpc_lattice ? 1 : 0
  name  = "com.amazonaws.${var.region}.vpc-lattice"
}

data "aws_ec2_managed_prefix_list" "lattice_ipv6" {
  count = var.enable_vpc_lattice ? 1 : 0
  name  = "com.amazonaws.${var.region}.ipv6.vpc-lattice"
}
