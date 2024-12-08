resource "aws_lb" "aarif_application" {
 name               = "aarif-app-lb"
 internal           = false
 load_balancer_type = "application"
 security_groups    = var.public_security_group_ids
 subnets            = var.public_subnets
}
resource "aws_lb_target_group" "aarif_app_targets" {
 name     = "aarif-app-targets"
 port     = 80
 protocol = "HTTP"
 vpc_id   = var.vpc_id
}
resource "aws_lb_listener" "aarif_app_listener" {
 load_balancer_arn = aws_lb.aarif_application.arn
 port              = 80
 protocol          = "HTTP"
 default_action {
   type             = "forward"
   target_group_arn = aws_lb_target_group.aarif_app_targets.arn
 }
}
resource "aws_lb" "aarif_nlb" {
 name               = "aarif-nlb"
 internal           = true
 load_balancer_type = "network"
 subnets            = [module.vpc.subnet_private[*].id]
}
resource "aws_lb_target_group" "aarif_nlb_targets" {
 name     = "aarif-nlb-targets"
 port     = 80
 protocol = "TCP"
 vpc_id   = module.vpc.main.id
}
resource "aws_lb_listener" "aarif_nlb_listener" {
 load_balancer_arn = aws_lb.aarif_nlb.arn
 port              = 80
 protocol          = "TCP"
 default_action {
   type             = "forward"
   target_group_arn = aws_lb_target_group.aarif_nlb_targets.arn
 }
}
