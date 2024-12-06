resource "aws_s3_bucket" "secure_bucket" {
  bucket = "secure-private-bucket-aarif1"
  acl    = "private"
  versioning {
    enabled = true
  }
}
