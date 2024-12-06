resource "aws_s3_bucket" "secure_bucket" {
  bucket = "secure-private-bucket-aarif2"
  acl    = "private"
  versioning {
    enabled = true
  }
}
