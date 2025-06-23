
provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source              = "../../modules/vpc"
  cidr_block          = "10.0.0.0/16"
  public_subnet_cidr  = "10.0.1.0/24"
  private_subnet_cidr = "10.0.2.0/24"
  az                  = "us-east-1a"
  name                = "dev"
}

module "iam" {
  source = "../../modules/iam"
}

module "ec2" {
  source               = "../../modules/ec2"
  ami                  = var.ami
  instance_type        = var.instance_type
  subnet_id            = module.vpc.public_subnet_id
  security_group_ids   = [module.vpc.public_subnet_id]
  name                 = "dev-app"
  vpc_id               = module.vpc.public_subnet_id
  iam_instance_profile = module.iam.ec2_profile_name
}
