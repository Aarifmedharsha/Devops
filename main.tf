module "vpc" {
 source            = "./modules/vpc"
 cidr_block        = "10.0.0.0/16"
 availability_zones = ["us-west-2a", "us-west-2b"]
}
module "security_groups" {
 source      = "./modules/security_groups"
 vpc_id      = module.vpc.main.id
}
module "ec2" {
 source                  = "./modules/ec2"
 instance_type           = "t2.micro"
 image_id                = "ami-055e3d4f0bbeb5878" # Amazon Linux 2 AMI
 instance_profile_name   = module.iam.aarif_public_role.name
 public_security_group_ids = [module.security_groups.aarif_public_sg.id]
 private_security_group_ids = [module.security_groups.aarif_private_sg.id]
 private_subnet_id       = module.vpc.subnet_private[0].id
}
module "load_balancer" {
 source              = "./modules/load_balancer"
 vpc_id              = module.vpc.main.id
 public_security_group_ids = [module.security_groups.aarif_public_sg.id]
 public_subnets      = module.vpc.subnet_public[*].id
}
module "s3" {
 source = "./modules/s3"
 bucket_name = "aarif-private-bucket"
}
has context menu
module "iam" {
 source       = "./modules/iam"
 assume_role_policy = jsonencode({
   Version = "2012-10-17",
   Statement = [
     {
       Action    = "sts:AssumeRole",
       Effect    = "Allow",
       Principal = { Service = "ec2.amazonaws.com" }
     }
   ]
 })
 s3_policy = jsonencode({
   Version = "2012-10-17",
   Statement = [
     {
       Action   = ["s3:*"],
       Effect   = "Allow",
       Resource = ["arn:aws:s3:::aarif-private-bucket", "arn:aws:s3:::aarif-private-bucket/*"]
     }
   ]
 })
}
