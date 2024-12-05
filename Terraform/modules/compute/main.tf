resource "aws_launch_template" "public_lt" {
 name          = "public-lt"
 image_id      = "ami-0c02fb55956c7d316" # Amazon Linux 2
 instance_type = "t2.micro"
 network_interfaces {
   associate_public_ip_address = true
   security_groups             = [var.public_sg_id]
 }
 iam_instance_profile {
   name = var.iam_instance_profile
 }
}
resource "aws_autoscaling_group" "asg" {
 desired_capacity     = 2
 max_size             = 4
 min_size             = 1
 vpc_zone_identifier  = var.public_subnet_ids
 launch_template {
   id      = aws_launch_template.public_lt.id
   version = "$Latest"
 }
}
resource "aws_instance" "private_instance" {
 ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2
 instance_type = "t2.micro"
 subnet_id     = var.private_subnet_id
 security_groups = [var.private_sg_id]
}