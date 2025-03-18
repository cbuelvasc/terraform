locals {
  suffix = "${var.tags.project}-${var.tags.env}-${var.tags.region}" # resource-project-env-region
}

resource "random_string" "s3-suffix" {
  length  = 4
  special = false
  upper   = false
}

locals {
  s3-suffix = "${var.tags.project}-${random_string.s3-suffix.id}"
}