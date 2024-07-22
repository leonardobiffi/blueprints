module "eks_role" {
  source = "../"

  env    = "dev"
  region = "us-east-1"

  name = "my-role"

  cluster_service_accounts = {
    (var.cluster_name) = ["default:my-service"]
  }

  # Attach the policies to the role
  role_policy_arns = {
    AmazonEKS_CNI_Policy = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  }

  # Custom Policy for attaching to the role
  policy_statements = [
    {
      sid    = "AllowS3BucketList"
      effect = "Allow"
      actions = [
        "s3:ListBucket",
      ]
      resources = ["*"]
    },
    {
      sid    = "AllowECRList"
      effect = "Allow"
      actions = [
        "ecr:BatchGetImage",
        "ecr:BatchCheckLayerAvailability",
        "ecr:GetAuthorizationToken",
        "ecr:GetLifecyclePolicy",
        "ecr:GetDownloadUrlForLayer",
        "ecr:GetRepositoryPolicy",
        "ecr:GetLifecyclePolicyPreview",
        "ecr:DescribeRepositories",
        "ecr:DescribeImages",
        "ecr:DescribeImageScanFindings",
        "ecr:ListImages",
        "ecr:ListTagsForResource",
      ]
      resources = ["*"]
    }
  ]

  tags = {
    ManagedBy   = "Terraform"
    Environment = "dev"
  }
}
