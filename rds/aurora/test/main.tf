module "vpc" {
  source = "../../../vpc/vpc"

  region = "us-east-1"
  env    = "dev"

  name       = "my-vpc"
  cidr_block = "10.0.0.0/16"

  availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets    = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets     = ["10.0.21.0/24", "10.0.22.0/24", "10.0.23.0/24"]
  database_subnets   = ["10.0.41.0/24", "10.0.42.0/24", "10.0.43.0/24"]

  enable_nat_gateway = true

  tags = {
    ManagedBy   = "Terraform"
    Environment = "dev"
  }
}

module "aurora" {
  source = "../"

  env    = "dev"
  region = "us-east-1"

  name            = "my-db"
  vpc_id          = module.vpc.vpc_id
  subnets         = module.vpc.private_subnets
  engine          = "aurora-mysql"
  engine_mode     = "provisioned"
  engine_version  = "8.0"
  master_username = "root"

  apply_immediately   = true
  skip_final_snapshot = true
  deletion_protection = false

  security_group_rules = {
    vpc_ingress = {
      cidr_blocks = ["10.55.0.0/18"]
    }
  }

  instance_class = "db.t3.small"

  instances = {
    1 = {}
  }
}
