/* Create SSH key pair */

provider "aws" {
  region = "${var.region}"
  access_key = "${var.acc_key}"
  secret_key = "${var.sec_key}"
}
