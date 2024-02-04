# Module for creating a Virtual Private Cloud (VPC) in AWS
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.5.1"

  # VPC name
  name = "main"

  # VPC CIDR block
  cidr = "10.0.0.0/16"

  # Availability Zones for private and public subnets
  azs = ["us-east-1a", "us-east-1b"]

  # CIDR blocks for private subnets
  private_subnets = ["10.0.0.0/19", "10.0.32.0/19"]

  # CIDR blocks for public subnets
  public_subnets = ["10.0.64.0/19", "10.0.96.0/19"]

  # Enable NAT Gateway for private subnets
  enable_nat_gateway = true

  # Use a single NAT Gateway for all private subnets
  single_nat_gateway = true

  # Use one NAT Gateway per Availability Zone
  one_nat_gateway_per_az = false

  # Enable DNS hostnames and support
  enable_dns_hostnames = true
  enable_dns_support   = true

  # Tags to apply to AWS resources created by the VPC module
  tags = {
    Environment = "Production"
  }
}
