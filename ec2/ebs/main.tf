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

resource "aws_ebs_volume" "main" {
  availability_zone = var.availability_zone
  size              = var.size
  encrypted         = var.encrypted
  iops              = var.iops
  throughput        = var.throughput
  type              = var.type
  kms_key_id        = var.kms_key_id

  tags = merge(local.tags, {
    Name = local.name
  })
}

resource "aws_volume_attachment" "main" {
  device_name = var.device_name
  volume_id   = aws_ebs_volume.main.id
  instance_id = var.instance_id
}
