resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "backup_bucket" {
  bucket = "${var.bucket_prefix}-${random_id.bucket_suffix.hex}"
  force_destroy = true

  tags = {
    Name = "${var.bucket_prefix}-backup"
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.backup_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "lifecycle" {
  bucket = aws_s3_bucket.backup_bucket.id

  rule {
    id     = "cleanup-old-objects"
    status = "Enabled"

    expiration {
      days = 30
    }
  }
}
