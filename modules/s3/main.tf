resource "aws_s3_bucket" "aarif_private_bucket" {
 bucket = "aarif-private-bucket"
 acl    = "private"
 versioning {
   enabled = true
 }
}
