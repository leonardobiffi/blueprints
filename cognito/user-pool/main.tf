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

module "cognito_user_pool" {
  source  = "lgallard/cognito-user-pool/aws"
  version = "~> 0.26"

  user_pool_name = local.name

  email_verification_message                            = var.email_verification_message
  email_verification_subject                            = var.email_verification_subject
  username_configuration                                = var.username_configuration
  admin_create_user_config                              = var.admin_create_user_config
  admin_create_user_config_allow_admin_create_user_only = var.admin_create_user_config_allow_admin_create_user_only
  temporary_password_validity_days                      = var.temporary_password_validity_days
  admin_create_user_config_email_message                = var.admin_create_user_config_email_message
  admin_create_user_config_email_subject                = var.admin_create_user_config_email_subject
  admin_create_user_config_sms_message                  = var.admin_create_user_config_sms_message

  alias_attributes         = var.alias_attributes
  username_attributes      = var.username_attributes
  deletion_protection      = var.deletion_protection
  auto_verified_attributes = var.auto_verified_attributes

  sms_configuration = {
    external_id     = var.sms_configuration_external_id
    sns_caller_arn  = var.sms_configuration_external_id != null ? aws_iam_role.sms[0].arn : null
  }

  device_configuration                                       = var.device_configuration
  device_configuration_challenge_required_on_new_device      = var.device_configuration_challenge_required_on_new_device
  device_configuration_device_only_remembered_on_user_prompt = var.device_configuration_device_only_remembered_on_user_prompt

  email_configuration                        = var.email_configuration
  email_configuration_configuration_set      = var.email_configuration_configuration_set
  email_configuration_reply_to_email_address = var.email_configuration_reply_to_email_address
  email_configuration_source_arn             = var.email_configuration_source_arn
  email_configuration_email_sending_account  = var.email_configuration_email_sending_account
  email_configuration_from_email_address     = var.email_configuration_from_email_address

  lambda_config                                = var.lambda_config
  lambda_config_create_auth_challenge          = var.lambda_config_create_auth_challenge
  lambda_config_custom_message                 = var.lambda_config_custom_message
  lambda_config_define_auth_challenge          = var.lambda_config_define_auth_challenge
  lambda_config_post_authentication            = var.lambda_config_post_authentication
  lambda_config_post_confirmation              = var.lambda_config_post_confirmation
  lambda_config_pre_authentication             = var.lambda_config_pre_authentication
  lambda_config_pre_sign_up                    = var.lambda_config_pre_sign_up
  lambda_config_pre_token_generation           = var.lambda_config_pre_token_generation
  lambda_config_user_migration                 = var.lambda_config_user_migration
  lambda_config_verify_auth_challenge_response = var.lambda_config_verify_auth_challenge_response
  lambda_config_kms_key_id                     = var.lambda_config_kms_key_id
  lambda_config_custom_email_sender            = var.lambda_config_custom_email_sender
  lambda_config_custom_sms_sender              = var.lambda_config_custom_sms_sender

  mfa_configuration                                = var.mfa_configuration
  software_token_mfa_configuration                 = var.software_token_mfa_configuration
  software_token_mfa_configuration_enabled         = var.software_token_mfa_configuration_enabled
  password_policy                                  = var.password_policy
  password_policy_minimum_length                   = var.password_policy_minimum_length
  password_policy_require_lowercase                = var.password_policy_require_lowercase
  password_policy_require_numbers                  = var.password_policy_require_numbers
  password_policy_require_symbols                  = var.password_policy_require_symbols
  password_policy_require_uppercase                = var.password_policy_require_uppercase
  password_policy_temporary_password_validity_days = var.password_policy_temporary_password_validity_days

  schemas                                  = var.schemas
  string_schemas                           = var.string_schemas
  number_schemas                           = var.number_schemas
  sms_authentication_message               = var.sms_authentication_message
  sms_verification_message                 = var.sms_verification_message
  user_attribute_update_settings           = var.user_attribute_update_settings
  user_pool_add_ons                        = var.user_pool_add_ons
  user_pool_add_ons_advanced_security_mode = var.user_pool_add_ons_advanced_security_mode

  verification_message_template                       = var.verification_message_template
  verification_message_template_default_email_option  = var.verification_message_template_default_email_option
  verification_message_template_email_message_by_link = var.verification_message_template_email_message_by_link
  verification_message_template_email_subject_by_link = var.verification_message_template_email_subject_by_link

  domain                 = var.domain
  domain_certificate_arn = var.domain_certificate_arn

  clients                                     = var.clients
  client_allowed_oauth_flows                  = var.client_allowed_oauth_flows
  client_allowed_oauth_flows_user_pool_client = var.client_allowed_oauth_flows_user_pool_client
  client_allowed_oauth_scopes                 = var.client_allowed_oauth_scopes
  client_auth_session_validity                = var.client_auth_session_validity
  client_callback_urls                        = var.client_callback_urls
  client_default_redirect_uri                 = var.client_default_redirect_uri
  client_enable_token_revocation              = var.client_enable_token_revocation
  client_explicit_auth_flows                  = var.client_explicit_auth_flows
  client_generate_secret                      = var.client_generate_secret
  client_logout_urls                          = var.client_logout_urls
  client_name                                 = var.client_name
  client_read_attributes                      = var.client_read_attributes
  client_prevent_user_existence_errors        = var.client_prevent_user_existence_errors
  client_supported_identity_providers         = var.client_supported_identity_providers
  client_write_attributes                     = var.client_write_attributes
  client_access_token_validity                = var.client_access_token_validity
  client_id_token_validity                    = var.client_id_token_validity
  client_refresh_token_validity               = var.client_refresh_token_validity
  client_token_validity_units                 = var.client_token_validity_units

  user_groups            = var.user_groups
  user_group_name        = var.user_group_name
  user_group_description = var.user_group_description
  user_group_precedence  = var.user_group_precedence
  user_group_role_arn    = var.user_group_role_arn

  resource_servers                  = var.resource_servers
  resource_server_name              = var.resource_server_name
  resource_server_identifier        = var.resource_server_identifier
  resource_server_scope_name        = var.resource_server_scope_name
  resource_server_scope_description = var.resource_server_scope_description
  recovery_mechanisms               = var.recovery_mechanisms
  identity_providers                = var.identity_providers

  tags = local.tags
}

# IAM Role
data "aws_iam_policy_document" "sms" {
  count = var.sms_configuration_external_id != null ? 1 : 0

  statement {
    effect = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["cognito-idp.amazonaws.com"]
    }
    condition {
      test     = "StringEquals"
      variable = "sts:ExternalId"
      values   = ["cb328c1d-74bc-4691-b122-3c54f90aa31b"]
    }
  }
}

resource "aws_iam_role" "sms" {
  count = var.sms_configuration_external_id != null ? 1 : 0
  
  name               = "${local.name}-cognito-sms"
  assume_role_policy = data.aws_iam_policy_document.sms[0].json
}

data "aws_iam_policy_document" "sms_policy" {
  count = var.sms_configuration_external_id != null ? 1 : 0

  statement {
    effect = "Allow"
    actions = [
      "sns:publish",
    ]
    resources = ["*"]
  }
}

resource "aws_iam_role_policy" "sms" {
  name   = "${local.name}-cognito-sms"
  role   = aws_iam_role.sms[0].id
  policy = data.aws_iam_policy_document.sms_policy[0].json
}
