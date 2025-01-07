/* resource "aws_s3_bucket" "cloudmarauders-tokyo-s3" {
  bucket = "cloudmarauders-tokyo-s3"
  acl    = "private"
  
  versioning {
    enabled = true
  }

  tags = {
    Name = "cloudmarauders-tokyo-s3"
    Owner = "cloudmarauders"
    ring = "prod"
  }
  
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tokyo_s3_encryption" {
  bucket = aws_s3_bucket.cloudmarauders-tokyo-s3.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}


/*resource "aws_s3_bucket_policy" "cloudmarauders-tokyo-s3-policy" {
  bucket = aws_s3_bucket.cloudmarauders-tokyo-s3.bucket

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
        Sid   = "AllowReplicationFromSources"
        Effect = "Allow"
        Principal = {
            AWS = aws_iam_role.replication.arn
        }
        Action = "s3:ReplicateObject"
        Resource = "${aws_s3_bucket.cloudmarauders-tokyo-s3.arn}/*"
    }]
  })
}
*/




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
        Resource = "${aws_s3_bucket.cloudmarauders-tokyo-s3.arn}/*"
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


