variable "cidr_block" {
 type = string
}
variable "availability_zones" {
 type = list(string)
}
variable "instance_type" {
 type = string
}
variable "image_id" {
 type = string
}
variable "instance_profile_name" {
 type = string
}
variable "public_security_group_ids" {
 type = list(string)
}
variable "private_security_group_ids" {
 type = list(string)
}
variable "private_subnet_id" {
 type = string
}
variable "vpc_id" {
 type = string
}
variable "public_subnets" {
 type = list(string)
}
variable "assume_role_policy" {
 type = string
}
variable "s3_policy" {
 type = string
}
variable "bucket_name" {
 type = string
}
