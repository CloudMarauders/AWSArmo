/*resource "aws_s3_bucket" "cloudmaraduers-california-s3" {
  bucket = "cloudmaraduers-california-s3"
  acl    = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  versioning {
    enabled = true
  }

  lifecycle_rule {
    id      = "DeleteAfterReplication"
    enabled = true


    expiration {
      days = 1
    }

    noncurrent_version_expiration {
      days = 1
    }
  }
  tags = {
    Name  = "cloudmaraduers-california-s3"
    Owner = "CloudMaraduers"
    ring  = "prod"
  }
}




  resource "aws_s3_bucket_replication_configuration" "cloudmaraduers-california-replication" {
    
    depends_on = [ aws_s3_bucket.cloudmaraduers-california-s3 ]
    role = aws_iam_role.replication_role.arn
    bucket = aws_s3_bucket.cloudmaraduers-california-s3.id

    rule {
      id     = "ReplicateToTokyo"
      status = "Enabled"

      filter {
        prefix = ""
      }

      destination {
        bucket        = aws_s3_bucket.cloudmarauders-tokyo-s3.arn
        storage_class = "STANDARD"
      }

    }
    }

    */