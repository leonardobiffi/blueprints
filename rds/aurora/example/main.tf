module "rds" {
  source = "../"

  env    = "dev"
  region = "us-east-1"

  name            = "test-psp"
  vpc_id          = "vpc-0639e485fcc0908b3"
  subnets         = ["subnet-07c7110fa4c88294b", "subnet-0083c6d62e2667764", "subnet-05a19eddea148fcfc"]
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
