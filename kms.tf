resource "aws_kms_key" "kms_key" {
  depends_on = ["aws_s3_bucket.base_s3"]
  deletion_window_in_days = 7
  description = "Encryption key for storing secrets"
}
