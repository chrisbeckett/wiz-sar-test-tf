resource "aws_kms_key" "wiz-sar-test-key" {
  description             = "Wiz SAR Test Key for AWS-KMS-001 playbook"
  deletion_window_in_days = 30
}

resource "aws_kms_alias" "wiz-sar-test-key" {
  name          = "alias/wiz-sar-test-key"
  target_key_id = aws_kms_key.wiz-sar-test-key.key_id
}