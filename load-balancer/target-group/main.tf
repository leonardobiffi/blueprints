provider "aws" {
  region = var.region
}

locals {
  name = "${var.env}-${var.name}"
  tags = merge(var.tags, var.system_tags, {
    Name        = local.name
    Environment = var.env
    ManagedBy   = "Terraform"
  })

  # Add tag environment to target groups
  target_groups = [for tg in var.target_groups : merge(tg, { tags = merge(try(tg.tags, {}), { Environment = var.env }) })]
  # Create a map of target group names to ARNs
  target_group_arns_by_service_tag = try({ for i, tg in var.target_groups : tg.tags.service => aws_lb_target_group.main[i].arn }, null)
}

resource "aws_lb_target_group" "main" {
  count = length(var.target_groups)

  name        = lookup(var.target_groups[count.index], "name", null)
  name_prefix = lookup(var.target_groups[count.index], "name_prefix", null)

  vpc_id           = var.vpc_id
  port             = try(var.target_groups[count.index].backend_port, null)
  protocol         = try(upper(var.target_groups[count.index].backend_protocol), null)
  protocol_version = try(upper(var.target_groups[count.index].protocol_version), null)
  target_type      = try(var.target_groups[count.index].target_type, null)

  connection_termination             = try(var.target_groups[count.index].connection_termination, null)
  deregistration_delay               = try(var.target_groups[count.index].deregistration_delay, null)
  slow_start                         = try(var.target_groups[count.index].slow_start, null)
  proxy_protocol_v2                  = try(var.target_groups[count.index].proxy_protocol_v2, false)
  lambda_multi_value_headers_enabled = try(var.target_groups[count.index].lambda_multi_value_headers_enabled, false)
  load_balancing_algorithm_type      = try(var.target_groups[count.index].load_balancing_algorithm_type, null)
  preserve_client_ip                 = try(var.target_groups[count.index].preserve_client_ip, null)
  ip_address_type                    = try(var.target_groups[count.index].ip_address_type, null)
  load_balancing_cross_zone_enabled  = try(var.target_groups[count.index].load_balancing_cross_zone_enabled, null)

  dynamic "health_check" {
    for_each = try([var.target_groups[count.index].health_check], [])

    content {
      enabled             = try(health_check.value.enabled, null)
      interval            = try(health_check.value.interval, null)
      path                = try(health_check.value.path, null)
      port                = try(health_check.value.port, null)
      healthy_threshold   = try(health_check.value.healthy_threshold, null)
      unhealthy_threshold = try(health_check.value.unhealthy_threshold, null)
      timeout             = try(health_check.value.timeout, null)
      protocol            = try(health_check.value.protocol, null)
      matcher             = try(health_check.value.matcher, null)
    }
  }

  dynamic "stickiness" {
    for_each = try([var.target_groups[count.index].stickiness], [])

    content {
      enabled         = try(stickiness.value.enabled, null)
      cookie_duration = try(stickiness.value.cookie_duration, null)
      type            = try(stickiness.value.type, null)
      cookie_name     = try(stickiness.value.cookie_name, null)
    }
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = local.tags
}

locals {
  # Merge the target group index into a product map of the targets so we
  # can figure out what target group we should attach each target to.
  # Target indexes can be dynamically defined, but need to match
  # the function argument reference. This means any additional arguments
  # can be added later and only need to be updated in the attachment resource below.
  # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group_attachment#argument-reference
  target_group_attachments = merge(flatten([
    for index, group in var.target_groups : [
      for k, targets in group : {
        for target_key, target in targets : join(".", [index, target_key]) => merge({ tg_index = index }, target)
      }
      if k == "targets"
    ]
  ])...)
}

resource "aws_lb_target_group_attachment" "this" {
  for_each = { for k, v in local.target_group_attachments : k => v }

  target_group_arn  = aws_lb_target_group.main[each.value.tg_index].arn
  target_id         = each.value.target_id
  port              = lookup(each.value, "port", null)
  availability_zone = lookup(each.value, "availability_zone", null)
}
