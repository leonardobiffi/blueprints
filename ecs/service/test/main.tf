module "ecs_cluster" {
  source = "../../cluster"

  env    = "dev"
  region = "us-east-1"

  name = "my-ecs-cluster"

  create_cloudwatch_log_group = false
  container_insights          = "disabled"

  fargate_capacity_providers = {
    FARGATE = {
      weight = 1
      base   = 1
    }
    FARGATE_SPOT = {
      weight = 4
    }
  }

  tags = {
    ManagedBy = "Terraform"
  }
}

module "ecs_service" {
  source = "../"

  env    = "dev"
  region = "us-east-1"

  name        = "my-ecs-service"
  cluster_arn = "arn:aws:ecs:us-east-1:123456789012:cluster/my-ecs-cluster"

  cpu    = 512
  memory = 1024

  container_port   = 8080
  target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:123456789012:targetgroup/my-ecs-service/1234567890123456"

  subnet_ids = ["subnet-e3267e84", "subnet-7d140672"]

  security_group_rules = {
    alb_ingress = {
      type                     = "ingress"
      from_port                = 8080
      to_port                  = 8080
      protocol                 = "tcp"
      description              = "Service port"
      source_security_group_id = "sg-12345678901234567" # sg for ALB
    }
    egress_all = {
      type        = "egress"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
