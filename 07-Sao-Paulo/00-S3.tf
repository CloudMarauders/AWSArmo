/*resource "aws_s3_bucket" "cloudmaraduers-SaoPaulo-s3" {
  bucket = "cloudmaraduers-SaoPaulo-s3"
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
    Name  = "cloudmaraduers-SaoPaulo-s3"
    Owner = "CloudMaraduers"
    ring  = "prod"
  }
}




  resource "aws_s3_bucket_replication_configuration" "cloudmaraduers-SaoPaulo-replication" {
    
    depends_on = [ aws_s3_bucket.cloudmaraduers-SaoPaulo-s3 ]
    role = aws_iam_role.replication_role.arn
    bucket = aws_s3_bucket.cloudmaraduers-SaoPaulo-s3.id

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