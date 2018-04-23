
output "sg_id" {
  value = "${aws_security_group.dev_subnet_sg.id}"
}
output "subnet_id" {
  value = "${aws_subnet.dev_subnet.id}"
}
output "kms_key_arn" {
  value = "${aws_kms_key.kms_key.arn}"
}
output "s3_bucket" {
  value = "${aws_s3_bucket.base_s3.bucket}"
}
output "env" {
  value = "${var.env}"
}