resource "aws_s3_bucket" "base_s3" {
  bucket = "${var.env}-infra-${var.region}-base-bucket"
  force_destroy = true
}
