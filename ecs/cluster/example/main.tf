module "ecs_cluster" {
  source = "../"

  env    = "dev"
  region = "us-east-1"

  name = "my-ecs-cluster"

  create_cloudwatch_log_group = false
  container_insights          = "disabled"

  fargate_capacity_weight      = 0
  fargate_capacity_base        = 0
  fargate_spot_capacity_weight = 5
  fargate_spot_capacity_base   = 1

  tags = {
    ManagedBy = "Terraform"
  }
}
