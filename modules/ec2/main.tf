resource "aws_launch_template" "aarif_public_instance" {
 name          = "aarif-public-instance-template"
 instance_type = var.instance_type
 image_id      = var.image_id
 iam_instance_profile {
   name = var.instance_profile_name
 }
 vpc_security_group_ids = var.public_security_group_ids
}
resource "aws_instance" "aarif_private_instance" {
 ami                    = var.image_id
 instance_type          = var.instance_type
 subnet_id              = var.private_subnet_id
 vpc_security_group_ids = var.private_security_group_ids
}
resource "aws_autoscaling_group" "aarif_asg" {
 launch_template {
   id      = aws_launch_template.aarif_public_instance.id
   version = "$Latest"
 }
 min_size         = 1
 max_size         = 5
 desired_capacity = 2
 vpc_zone_identifier = module.vpc.subnet_public[*].id
}
