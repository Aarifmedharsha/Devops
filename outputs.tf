output "vpc_id" {
 value = module.vpc.main.id
}
output "public_subnets" {
 value = module.vpc.subnet_public[*].id
}
output "private_subnets" {
 value = module.vpc.subnet_private[*].id
}
output "public_security_group_id" {
 value = module.security_groups.aarif_public_sg.id
}
output "private_security_group_id" {
 value = module.security_groups.aarif_private_sg.id
}
output "iam_instance_profile_name" {
 value = module.iam.aarif_public_role.name
}
output "autoscaling_group_name" {
 value = aws_autoscaling_group.aarif_asg.name
}
output "nlb_arn" {
 value = aws_lb.aarif_nlb.arn
}
output "s3_bucket_arn" {
 value = aws_s3_bucket.aarif_private_bucket.arn
}
