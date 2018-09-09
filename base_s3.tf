resource "aws_s3_bucket" "base_s3" {
  bucket = "${var.env}-${var.region}-infra-base"
  force_destroy = true
}
