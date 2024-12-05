variable "vpc_id" {
 type = string
}
variable "public_subnet_ids" {
 type = list(string)
}
variable "private_subnet_id" {
 type = string
}
variable "asg_target_group" {
 type = string
}
variable "ec2_target_group" {
 type = string
}
variable "public_sg_id" {
 type = string
}