output "application_lb_arn" {
 value = aws_lb.application_lb.arn
}
output "network_lb_arn" {
 value = aws_lb.network_lb.arn
}