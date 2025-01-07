/*resource "aws_iam_role" "syslog_role" {
  name = "SyslogRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}


resource "aws_iam_instance_profile" "syslog_instance_profile" {
  name = "syslog_instance_profile"
  role = aws_iam_role.syslog_role.name
}




# IAM Role for S3 Replication
/*resource "aws_iam_role" "replication_role" {
  name = "s3-replication-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "s3.amazonaws.com"
        }
      }
    ]
  })
}

# IAM Policy for Replication
resource "aws_iam_policy" "replication_policy" {
  name = "s3-replication-policy"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "s3:GetObjectVersion",
          "s3:GetObjectVersionAcl",
          "s3:GetObjectVersionTagging"
        ],
        Resource = [
          "arn:aws:s3:::cloudmaraduers-california-s3/*",
          "arn:aws:s3:::cloudmaraduers-newyork-s3/*",
          "arn:aws:s3:::cloudmaraduers-australia-s3/*",
          "arn:aws:s3:::cloudmaraduers-hongkong-s3/*",
          "arn:aws:s3:::cloudmaraduers-london-s3/*",
          "arn:aws:s3:::cloudmaraduers-saopaulo-s3/*"
        ]
      },
      {
        Effect = "Allow",
        Action = [
          "s3:ReplicateObject",
          "s3:ReplicateDelete",
          "s3:ReplicateTags"
        ],
        Resource = "${aws_s3_bucket.cloudmaraduers-tokyo-s3.arn}/*"
      }
    ]
  })
}

# Attach Policy to Role
resource "aws_iam_role_policy_attachment" "replication_role_attach" {
  role       = aws_iam_role.replication_role.name
  policy_arn = aws_iam_policy.replication_policy.arn
}

*/