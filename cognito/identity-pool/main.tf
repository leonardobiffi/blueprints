provider "aws" {
  region = var.region
}

locals {
  name = "${var.env}-${var.name}"
  tags = merge(var.tags, var.system_tags, {
    Environment = var.env
    ManagedBy   = "Terraform"
  })
}

# Identity Pool
resource "aws_cognito_identity_pool" "main" {
  identity_pool_name = local.name

  allow_unauthenticated_identities = var.allow_unauthenticated_identities
  allow_classic_flow               = var.allow_classic_flow
  saml_provider_arns               = var.saml_provider_arns
  openid_connect_provider_arns     = var.openid_connect_provider_arns
  supported_login_providers        = var.supported_login_providers

  dynamic "cognito_identity_providers" {
    for_each = var.cognito_identity_providers
    content {
      client_id               = cognito_identity_providers.value.client_id
      provider_name           = cognito_identity_providers.value.provider_name
      server_side_token_check = cognito_identity_providers.value.server_side_token_check
    }
  }

  tags = local.tags
}

# Identity Pool Roles Attachment
resource "aws_cognito_identity_pool_roles_attachment" "main" {
  identity_pool_id = aws_cognito_identity_pool.main.id

  roles = {
    "authenticated"   = var.roles.authenticated ? aws_iam_role.authenticated.arn : null
    "unauthenticated" = var.roles.unauthenticated ? aws_iam_role.authenticated.arn : null
  }

  dynamic "role_mapping" {
    for_each = var.role_mapping
    content {
      ambiguous_role_resolution = role_mapping.value.ambiguous_role_resolution
      identity_provider         = role_mapping.value.identity_provider
      type                      = role_mapping.value.type
    }
  }
}

# IAM Role
data "aws_iam_policy_document" "authenticated" {
  statement {
    effect = "Allow"

    principals {
      type        = "Federated"
      identifiers = ["cognito-identity.amazonaws.com"]
    }

    actions = ["sts:AssumeRoleWithWebIdentity"]

    condition {
      test     = "StringEquals"
      variable = "cognito-identity.amazonaws.com:aud"
      values   = [aws_cognito_identity_pool.main.id]
    }

    condition {
      test     = "ForAnyValue:StringLike"
      variable = "cognito-identity.amazonaws.com:amr"
      values   = ["authenticated"]
    }
  }
}

resource "aws_iam_role" "authenticated" {
  name               = "${local.name}-cognito-authenticated"
  assume_role_policy = data.aws_iam_policy_document.authenticated.json
}

data "aws_iam_policy_document" "authenticated_role_policy" {
  statement {
    effect = "Allow"
    actions = [
      "cognito-identity:GetCredentialsForIdentity",
    ]
    resources = var.user_pool_arns
  }
}

resource "aws_iam_role_policy" "authenticated" {
  name   = "${local.name}-authenticated-policy"
  role   = aws_iam_role.authenticated.id
  policy = data.aws_iam_policy_document.authenticated_role_policy.json
}
