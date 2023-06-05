resource "random_string" "random-gcp-bucket-name" {
  length = 6
  special = false
  lower = true
}

resource "google_storage_bucket" "wiz-sar-test-bucket-002" {
  name          = "wiz-sar-test-${lower(random_string.random-gcp-bucket-name.result)}"
  location      = var.gcp-region
  force_destroy = true
  versioning {
    enabled = false
  }

  public_access_prevention = "inherited"
}

resource "google_storage_bucket_acl" "wiz-sar-test-bucket-acl" {
  bucket = google_storage_bucket.wiz-sar-test-bucket-002.name

  role_entity = [
    "OWNER:allUsers",
    "READER:allAuthenticatedUsers",
  ]
}