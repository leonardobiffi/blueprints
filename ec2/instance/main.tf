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

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 5.6"

  name = local.name

  instance_type          = var.instance_type
  key_name               = var.key_name
  monitoring             = var.monitoring
  vpc_security_group_ids = var.security_group_ids
  subnet_id              = var.subnet_id
  ami                    = length(var.ami_filters) > 0 ? data.aws_ami.main[0].id : var.ami

  user_data_base64            = base64encode(var.user_data)
  user_data_replace_on_change = false
  create_iam_instance_profile = var.create_iam_instance_profile
  iam_role_description        = "IAM role for EC2 instance ${local.name}"
  iam_role_policies           = var.iam_role_policies
  associate_public_ip_address = var.associate_public_ip_address

  ebs_block_device = var.ebs_block_device
  root_block_device = [
    {
      encrypted   = true
      volume_size = var.root_block_device.volume_size
      volume_type = var.root_block_device.volume_type
      throughput  = var.root_block_device.throughput
    }
  ]

  instance_tags = var.instance_tags
  tags          = local.tags
}

data "aws_ami" "main" {
  count = length(var.ami_filters) > 0 ? 1 : 0

  most_recent = true
  owners      = var.owners

  dynamic "filter" {
    for_each = var.ami_filters
    content {
      name   = filter.value.name
      values = filter.value.values
    }
  }
}

resource "aws_eip" "main" {
  count = var.associate_elastic_ip ? 1 : 0

  instance = module.ec2_instance.id
  domain   = "vpc"

  tags = merge(local.tags, {
    Name = local.name
  })
}
