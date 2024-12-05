resource "aws_iam_role" "s3_role" {
 name               = "s3-access-role"
 assume_role_policy = jsonencode({
   Version = "2012-10-17"
   Statement = [{
     Action    = "sts:AssumeRole"
     Effect    = "Allow"
     Principal = { Service = "ec2.amazonaws.com" }
   }]
 })
}
resource "aws_iam_policy" "s3_policy" {
 name   = "s3-access-policy"
 policy = jsonencode({
   Version = "2012-10-17"
   Statement = [{
     Action   = ["s3:*"]
     Effect   = "Allow"
     Resource = [var.s3_bucket_arn, var.s3_bucket_arn_wildcard]
   }]
 })
}
resource "aws_iam_role_policy_attachment" "s3_role_policy_attachment" {
 role       = aws_iam_role.s3_role.name
 policy_arn = aws_iam_policy.s3_policy.arn
}
resource "aws_iam_instance_profile" "instance_profile" {
 name = "s3-instance-profile"
 role = aws_iam_role.s3_role.name
}