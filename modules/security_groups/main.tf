resource "aws_security_group" "aarif_public_sg" {
 vpc_id = var.vpc_id
 ingress {
   from_port   = 80
   to_port     = 80
   protocol    = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
 }
 ingress {
   from_port   = 22
   to_port     = 22
   protocol    = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
 }
 egress {
   from_port   = 0
   to_port     = 0
   protocol    = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }
}
resource "aws_security_group" "aarif_private_sg" {
 vpc_id = var.vpc_id
 ingress {
   from_port       = 0
   to_port         = 0
   protocol        = "-1"
   security_groups = [aws_security_group.aarif_public_sg.id]
 }
 egress {
   from_port   = 0
   to_port     = 0
   protocol    = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }
}