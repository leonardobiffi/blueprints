module "vpc" {
  source = "../"

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
