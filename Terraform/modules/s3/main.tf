resource "aws_s3_bucket" "secure_bucket" {
  bucket = "secure-private-bucket-aarif"
}

resource "aws_s3_bucket_acl" "acl" {
  bucket = aws_s3_bucket.secure_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.secure_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}