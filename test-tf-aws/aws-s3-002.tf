resource "aws_s3_bucket" "wizsartestbucket002" {
  bucket_prefix = "wiz-sar-test-002-"
  force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "wizsartestbucket002acl" {
  bucket = aws_s3_bucket.wizsartestbucket002.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_ownership_controls" "wizsartestbucket002" {
  bucket = aws_s3_bucket.wizsartestbucket002.id
  rule {
    object_ownership = "ObjectWriter"
  }
}

resource "aws_s3_bucket_acl" "wizsartestbucket002" {
  depends_on = [aws_s3_bucket_ownership_controls.wizsartestbucket002]

  bucket = aws_s3_bucket.wizsartestbucket002.id
  acl    = "public-read"
}