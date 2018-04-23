resource "aws_s3_bucket" "base_s3" {
  bucket = "crabio-infra-${var.env}-base-bucket"
  force_destroy = true
}
