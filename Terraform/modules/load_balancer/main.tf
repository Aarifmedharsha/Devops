resource "aws_lb" "application_lb" {
 name               = "application-lb"
 internal           = false
 load_balancer_type = "application"
 security_groups    = [var.public_sg_id]
 subnets            = var.public_subnet_ids
}
resource "aws_lb_target_group" "asg_target_group" {
 name     = "asg-target-group"
 port     = 80
 protocol = "HTTP"
 vpc_id   = var.vpc_id
}
resource "aws_lb_target_group" "ec2_target_group" {
 name     = "ec2-target-group"
 port     = 80
 protocol = "TCP"
 vpc_id   = var.vpc_id
}
resource "aws_lb" "network_lb" {
 name               = "network-lb"
 internal           = true
 load_balancer_type = "network"
 subnets            = [var.private_subnet_id]
}