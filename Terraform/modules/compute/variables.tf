variable "vpc_id" {
 type = string
}
variable "public_subnet_ids" {
 type = list(string)
}
variable "private_subnet_id" {
 type = string
}
variable "public_sg_id" {
 type = string
}
variable "private_sg_id" {
 type = string
}
variable "iam_instance_profile" {
 type = string
}