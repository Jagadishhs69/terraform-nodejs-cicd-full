
resource "aws_s3_bucket" "this" {
  bucket = var.name
  acl    = "private"
  tags = {
    Name = var.name
  }
}
