resource "aws_s3_bucket" "base_s3" {
  bucket = "crab-io-base-bucket"
  force_destroy = true
}
output "s3_bucket" {
  value = "${aws_s3_bucket.base_s3.bucket}"
}