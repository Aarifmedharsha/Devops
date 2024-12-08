resource "aws_iam_role" "aarif_public_role" {
 name               = "aarif-public-role"
 assume_role_policy = var.assume_role_policy
}
resource "aws_iam_policy" "aarif_s3_access" {
 name        = "aarif-s3-access"
 description = "Full access to the S3 bucket"
 policy      = var.s3_policy
}
resource "aws_iam_role_policy_attachment" "aarif_attach_policy" {
 role       = aws_iam_role.aarif_public_role.name
 policy_arn = aws_iam_policy.aarif_s3_access.arn
}
resource "aws_iam_instance_profile" "aarif_public_role" {
 name = "aarif-public-instance-profile"
 role = aws_iam_role.aarif_public_role.name
}
