resource "aws_iam_policy" "s3_readonly" {
    name        = "S3ReadonlyPolicy"
    description = "Allow EC2 to read from S3"
    policy      = jsonencode({
        Version = "2012-10-17",
        Statement = [
            {
                Effect   = "Allow",
                Action   = [
                    "s3:ListBucket"
                ],
                Resource = "${var.bucket_arn}"
            },
            {
                Effect   = "Allow",
                Action   = [
                    "s3:GetObject",
                ],
                Resource = "${var.bucket_arn}/*"
            }
        ]
    })
}
resource "aws_iam_role" "ec2_role" {
    name               = "ec2-role"
    assume_role_policy = jsonencode({
        Version = "2012-10-17",
        Statement = [
            {
                Effect    = "Allow",
                Principal = {
                    Service = "ec2.amazonaws.com"
                },
                Action    = "sts:AssumeRole"
            }
        ]
    })
}

resource "aws_iam_policy_attachment" "attach_s3_policy" {
    name       = "attach-s3-policy"
    policy_arn = aws_iam_policy.s3_readonly.arn
    roles      = [aws_iam_role.ec2_role.name]
}

resource "aws_iam_instance_profile" "ec_profile" {
    name = "ec2-profile"
    role = aws_iam_role.ec2_role.name
  
}