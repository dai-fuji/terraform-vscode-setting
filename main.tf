# わざとインデントを崩しています
provider "aws" {
region = "ap-northeast-1"
}

    variable "bucket_name" {
    type        = string
      description = "S3 bucket name"
}

resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name

  # このネスト部分で indent-rainbow が機能します
  lifecycle_rule {
    enabled = true

    transition {
        days          = 30
      storage_class = "STANDARD_IA"
    }
  }

tags = {
    Name = "My bucket"
  }
}

    output "bucket_id" {
  value = aws_s3_bucket.example.id
}
