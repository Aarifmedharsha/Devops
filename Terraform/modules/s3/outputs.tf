output "bucket_arn" {
 value = aws_s3_bucket.secure_bucket.arn
}
output "bucket_arn_wildcard" {
 value = "${aws_s3_bucket.secure_bucket.arn}/*"
}