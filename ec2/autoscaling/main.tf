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

module "autoscaling" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "~> 7.4"

  name = local.name

  image_id                = try(jsondecode(data.aws_ssm_parameter.ecs_optimized_ami[0].value)["image_id"], var.image_id)
  instance_type           = var.instance_type
  default_instance_warmup = var.default_instance_warmup
  min_size                = var.min_size
  max_size                = var.max_size
  desired_capacity        = var.desired_capacity

  use_mixed_instances_policy = var.use_mixed_instances_policy
  mixed_instances_policy     = var.mixed_instances_policy
  user_data                  = base64encode(var.user_data)
  schedules                  = var.schedules

  security_groups                 = var.security_groups
  network_interfaces              = var.network_interfaces
  vpc_zone_identifier             = var.vpc_zone_identifier
  health_check_type               = var.health_check_type
  autoscaling_group_tags          = var.autoscaling_group_tags
  protect_from_scale_in           = var.protect_from_scale_in
  ignore_desired_capacity_changes = true
  create_iam_instance_profile     = true
  desired_capacity_type           = "units"

  iam_role_name        = local.name
  iam_role_description = "ECS role for ${local.name}"

  iam_role_policies = merge(var.iam_role_policies, {
    AmazonSSMManagedInstanceCore = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  })

  tags = local.tags
}

# https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html#ecs-optimized-ami-linux
data "aws_ssm_parameter" "ecs_optimized_ami" {
  count = var.ecs_image_id ? 1 : 0
  name  = "/aws/service/ecs/optimized-ami/amazon-linux-2/recommended"
}
