resource "random_string" "suffix" {
  count   = 6
  length  = 8
  special = false
  upper   = false
  numeric = false
}