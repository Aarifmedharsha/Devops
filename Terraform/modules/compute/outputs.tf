output "asg_target_group" {
 value = aws_autoscaling_group.asg.name
}
output "ec2_target_group" {
 value = aws_instance.private_instance.id
}