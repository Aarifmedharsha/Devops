provider "aws" {

  region = "us-west-2"

}

module "vpc" {

  source = "./modules/vpc"

}

module "security_groups" {

  source = "./modules/security_groups"

  vpc_id = module.vpc.vpc_id

}

module "compute" {

  source = "./modules/compute"

  vpc_id                  = module.vpc.vpc_id

  public_subnet_ids       = module.vpc.public_subnet_ids

  private_subnet_id       = module.vpc.private_subnet_id

  public_sg_id            = module.security_groups.public_sg_id

  private_sg_id           = module.security_groups.private_sg_id

  iam_instance_profile    = module.iam.instance_profile

}

module "load_balancer" {

  source = "./modules/load_balancer"

  vpc_id             = module.vpc.vpc_id

  public_subnet_ids  = module.vpc.public_subnet_ids

  private_subnet_id  = module.vpc.private_subnet_id

  asg_target_group   = module.compute.asg_target_group

  ec2_target_group   = module.compute.ec2_target_group

}

module "s3" {

  source = "./modules/s3"

}

module "iam" {

  source          = "./modules/iam"

  s3_bucket_arn   = module.s3.bucket_arn

  s3_bucket_arn_wildcard = module.s3.bucket_arn_wildcard

} 