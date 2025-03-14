resource "aws_s3_bucket" "my_bucket" {
  count  = 6
  bucket = "suppliers-${random_string.suffix[count.index].id}"
  tags = {
    Owner       = "NovaCorp"
    Environment = "Development"
    Office      = "CDMX"
    Department  = "IT"
  }
}