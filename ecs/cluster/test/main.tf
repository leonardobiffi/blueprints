module "ecs_cluster" {
  source = "../"

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
