variable "azs" {
 type    = list(string)
 default = ["us-west-2a", "us-west-2b"]
}
variable "public_subnets" {
 type    = list(string)
 default = ["10.0.1.0/24", "10.0.2.0/24"]
}
variable "private_subnet" {
 type    = string
 default = "10.0.3.0/24"
}