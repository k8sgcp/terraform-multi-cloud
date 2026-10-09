# AWS Network Module
module "aws_vpc" {
  source   = "../../modules/aws_vpc"
  vpc_name = "vpc-${var.environment}-01"
  vpc_cidr = "10.20.0.0/16"
  public_subnets = {
    "snet-aws-app-a" = { cidr = "10.20.1.0/24", az = "us-east-1a" }
  }
  tags = var.common_tags
}

# AWS EC2 Module
module "aws_host" {
  source        = "../../modules/aws_ec2"
  instance_name = "ec2-${var.environment}-dotnet-01"
  vpc_id        = module.aws_vpc.vpc_id
  subnet_id     = module.aws_vpc.subnet_ids["snet-aws-app-a"]
  instance_type = "t3.micro"
  tags          = var.common_tags
}
