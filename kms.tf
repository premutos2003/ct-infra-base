resource "aws_kms_key" "kms_key" {
  deletion_window_in_days = 7
  description = "Encryption key for storing secrets"
}
 output "kms_key_arn" {
   value = "${aws_kms_key.kms_key.arn}"
 }