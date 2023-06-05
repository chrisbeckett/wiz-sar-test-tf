resource "aws_s3_bucket" "wizsartestbucket" {
  bucket_prefix = "wiz-sar-test-001"
  force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "wizsartestbucketacl" {
  bucket = aws_s3_bucket.wizsartestbucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}