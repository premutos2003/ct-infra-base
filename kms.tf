resource "aws_kms_key" "kms_key" {
  description = "Encryption key for storing secrets"
}
 output "kms_key_arn" {
   value = "${aws_kms_key.kms_key.arn}"
 }