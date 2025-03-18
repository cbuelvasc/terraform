resource "aws_s3_bucket" "zeus_bucket" {
  bucket = local.s3-suffix
  tags = {
    Name = "s3_bucket-${local.suffix}"
  }
  provider = aws.virginia
}